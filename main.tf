module "create-service-account-policies" {
  source = "https://github.com/ast5005/gcp-service-accounts-aim-policy-test.git"

  members_dic = {
    "m1"  = "member1@inframanai.com"
    "m2"  = "member2@inframanai.com"
    "m3"  = "member3@inframanai.com"
  }

  service_account_dic = {
    "sa1" = "test-account-1"
    "sa2" = "test-account-2"
  }

  roles_dic  = {
    "role1" = "roles/iam.serviceAccountKeyAdmin"
    "role2" = "roles/iam.serviceAccountTokenCreator"
    "role3" = "roles/iam.serviceAccountUser"
  }

  policy_set  = {
    "p1"  = [
      members_dic["m1"],
      members_dic["m2"],
      service_account_dic["sa1"],
      service_account_dic["sa2"],
      roles_dic["role2"],
      roles_dic["role3"]
    ]
    "p2"  = [
      members_dic["m2"],
      service_account_dic["sa1"],
      service_account_dic["sa2"],
      roles_dic["role2"],
      roles_dic["role3"]
    ]
    "p3"  = [
      members_dic["m1"],
      members_dic["m2"],
      service_account_dic["sa2"],
      roles_dic["role2"],
      roles_dic["role3"]
    ]
    "p4"  = [
      members_dic["m1"],
      members_dic["m2"],
      service_account_dic["sa1"],
      service_account_dic["sa2"],
      roles_dic["role3"]
    ]

    "p5"  = [
      members_dic["m2"],
      service_account_dic["sa1"],
      roles_dic["role2"]
    ]
  }

}
