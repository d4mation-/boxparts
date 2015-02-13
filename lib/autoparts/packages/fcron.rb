module Autoparts
  module Packages
    class Fcron < Package
      name 'fcron'
      version '3.2.0'
      description 'Fcron: a cron server'
      source_url 'http://fcron.free.fr/archives/fcron-3.2.0.src.tar.gz'
      source_sha1 '09c149957b76e55df8fbbbeb2cb5d0dfb6be878e'
      source_filetype 'tar.gz'
      category Category::UTILITIES

      def compile 
         Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
            "--without-pam",
            "--without-selinux",
            "--without-audit",
            "--with-username=codio",
            "--with-groupname=codio",
            "--localstatedir=#{var_path}",
            "--sysconfdir=#{etc_path}",
            "--with-run-non-privileged=yes",
            "--without-sendmail",
            "--with-rootname=codio",
            "--with-rootgroup=codio"
          ]
          execute './configure', *args
          execute 'make'         
         end
      end
      
      def install
        Dir.chdir(name_with_version) do
          execute 'make', 'install'
        end
      end

      def start
        execute sbin_path + "fcron"
      end

      def stop
        Process.kill 15, File.read(pid_file).to_i
      end

      def etc_path
        Path.etc + name
      end
      
      def pid_file
        var_path + 'run' + 'fcron.pid'
      end
      
      def var_path 
        Path.var + name
      end
      
      def running?
        pid_file.exist?
      end

      def tips
        <<-EOS.unindent
        To start cron
          $ parts start fcron
        
        To stop cron
          $ parts stop fcron
        
        To edit rules: 
          $ fcron -e
        
        EOS
      end
    end
  end
end
