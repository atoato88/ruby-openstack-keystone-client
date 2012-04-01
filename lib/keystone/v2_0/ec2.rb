require 'openstack-client/base'

module Keystone
  module V2_0
  end
end

class Keystone::V2_0::EC2 < Openstack::Client::Resource
end

class Keystone::V2_0::EC2CredentialsManager < Openstack::Client::Manager
  RESOURCE_CLASS = Keystone::V2_0::EC2

  def initialize api
    super api
  end

  def create user_id, tenant_id
    params = {"tenant_id" => tenant_id}

    self._create("/users/#{user_id}/credentials/OS-EC2", params, "credential")
  end

  def list user_id
    self._list("/users/#{user_id}/credentials/OS-EC2", "credentials")
  end

  def get user_id, access
    self._get("/users/#{user_id}/credentials/OS-EC2/#{getid(access)}", "credential")
  end

  def delete user_id, access
    self._delete("/users/#{user_id}/credentials/OS-EC2/#{getid(access)}")
  end

end
