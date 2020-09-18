locals{
  members_dic = {
    m1 = "user:abdullahtazebay@gmail.com"
    m2 = "user:astazebay2020@gmail.com"
    m3 = "user:orhanevranos@gmail.com"
  }

  service_account_dic = {
    sa1 = "test-account-1"
    sa2 = "test-account-2"
  }

  roles_dic = {
    role1 = "roles/iam.serviceAccountUser"
    role2 = "roles/iam.serviceAccountTokenCreator"
    role3 = "roles/iam.serviceAccountKeyAdmin"
  }
}

module "create-sa-iam-policy" {
  //source = "github.com/InfraManAI/gcp-iam-modules.git//gcp-service-account-iam-policy"
  source = "../gcp-iam-modules/gcp-service-account-iam-policy"
  policy_set_policy = {
    policy_1 = {
      members_policy = [
        local.members_dic["m1"],
        local.members_dic["m2"]]
      service_accounts_policy = [
        local.service_account_dic["sa1"],
       ]
      roles_policy = [
        local.roles_dic["role1"],
        local.roles_dic["role3"]
      ],
      desc_policy = "Policy Test 1"
    }

    policy_2 = {
      members_binding = [
        local.members_dic["m2"]]
      service_accounts_binding = [
        local.service_account_dic["sa2"],
       ]
      roles_binding = [
        local.roles_dic["role2"],
        local.roles_dic["role1"],
        local.roles_dic["role3"]
      ],
      desc_binding = "Policy Test 2"
      mode = "binding"
    }

    /*p3 = {
      members = [
        local.members_dic["m1"],
        local.members_dic["m2"],]
      service_accounts  = [
        local.service_account_dic["sa1"]]
      roles = [
        local.roles_dic["role2"],
        local.roles_dic["role3"]]
      desc = "Policy Test 3"
      mode = "binding"
    }

    p4 = {
      members = [
        local.members_dic["m1"],
        local.members_dic["m2"],]
      service_accounts = [
        local.service_account_dic["sa1"],
        local.service_account_dic["sa2"],]
      roles = [
        local.roles_dic["role2"],
        local.roles_dic["role3"]]
      desc = "Policy Test 4"
      mode = "binding"
    }

    p5 = {
      members = [
        local.members_dic["m2"],]
      service_accounts = [
        local.service_account_dic["sa1"],]
      roles = [
        local.roles_dic["role2"]]
      desc = "Policy Test 5"
      mode = "member"
    }

    p6 = {
      members = [
        local.members_dic["m3"],]
      service_accounts = [
        local.service_account_dic["sa2"],]
      roles = [
        local.roles_dic["role3"]]
      desc = "Policy Test 6"
      mode = "member"
    }*/

  }
}
