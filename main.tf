locals{
  members_dic = {
    m1 = "user:abdullahtazebay@gmail.com"
    m2 = "user:astazebay2020@gmail.com"
    m3 = "user:orhanevranos@gmail.com"
  }

  service_account_dic = {
    sa1 = "test-account-1x"
    sa2 = "test-account-2x"
  }

  roles_dic = {
    role1 = "roles/owner"
    role2 = "roles/iam.serviceAccountTokenCreator"
    role3 = "roles/iam.serviceAccountKeyAdmin"
  }
}

module "test-sa-iam-policy" {
  //source = "github.com/InfraManAI/gcp-iam-modules.git//gcp-service-account-iam-policy"
  source = "../gcp-iam-modules/gcp-project-iam"
  policy_set_policy = {
    p1 = {
      roles_policy = [
        "roles/owner",
        "roles/viewer",
        "roles/editor"
      ]
      members_policy = [
        "user:abdullahtazebay@gmail.com"
      ]
      service_accounts_policy = [
        "test-sa-1t"
      ]
      desc_policy = "Project IAM Policy Test - 1"
    }

    p2 = {
      roles_policy = [
        "roles/owner",
        "roles/viewer",
        "roles/editor"
      ]
      members_policy = [
        "user:orhanevranos@gmail.com"
      ]
      service_accounts_policy = [
        "test-sa-2t"
      ]
      desc_policy = "Project IAM Policy Test - 2"
    }

  }

}


/*
data "google_iam_policy" "admin"{
  binding{
    role = "roles/owner"
    members =[
      "user:abdullahtazebay@gmail.com"
    ]
  }

}
resource google_service_account "test-sa" {
  account_id = "test-1b"
  description = "test sa "
}

resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.test-sa.name
  policy_data = data.google_iam_policy.admin.policy_data

}

data "google_iam_policy" "admin-sa"{
  binding{
    role = "roles/owner"
    members =[
      "serviceAccount:test12@iam-test-289920.iam.gserviceaccount.com"
    ]
  }
}



output "sa-email" {
  value = google_service_account.test-sa.email
}




module "create-sa-iam-policy" {
  //source = "github.com/InfraManAI/gcp-iam-modules.git//gcp-service-account-iam-policy"
  source = "../gcp-iam-modules/gcp-service-account-iam-policy"
  policy_set_policy = {
    policy_1 = {
      members_policy = [
        local.members_dic["m1"],
       ]
      service_accounts_policy = [
        local.service_account_dic["sa1"],
       ]
      roles_policy = [
        local.roles_dic["role1"],

      ],
      desc_policy = "Policy Test 1"
    }

    /*policy_2 = {
      members_policy = [
        local.members_dic["m2"]]
      service_accounts_policy = [
        local.service_account_dic["sa2"],
       ]
      roles_policy = [
        local.roles_dic["role2"],
        local.roles_dic["role1"]
      ],
      desc_policy = "Policy Test 2"
    }


  }
  policy_set_binding = {

    p3 = {
      members_binding = [
        local.members_dic["m1"]
      ]
      service_accounts_binding  = [
        local.service_account_dic["sa1"]]
      roles_binding = [
        local.roles_dic["role2"],
        local.roles_dic["role3"]]
      desc_binding = "Policy Test 3"

    }

    p4 = {
      members_binding = [
        local.members_dic["m1"],
        local.members_dic["m2"],]
      service_accounts_binding = [
        local.service_account_dic["sa2"],
       ]
      roles_binding = [
        local.roles_dic["role3"]
       ]
      desc_binding = "Policy Test 4"
    }
}
  }
  policy_set_member = {}
}*/


