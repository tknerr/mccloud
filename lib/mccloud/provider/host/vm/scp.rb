require 'net/scp'
module Mccloud::Provider
  module Host
    module VmCommand

      def transfer(src,dest)
        scp(src,dest)
      end

      def scp(src,dest)
        Net::SCP.upload!(ip_address,@user,src,dest, :ssh => ssh_options)
      end

      # pass options as described here:
      # http://net-ssh.github.com/ssh/v2/api/classes/Net/SSH.html#M000002
      def ssh_options
        ssh_opts = Hash.new
        (ssh_opts[:keys] = @private_key_path) if @private_key_path
        (ssh_opts[:port] = @port) if @port
        ssh_opts
      end

    end #module
  end #module
end #module
