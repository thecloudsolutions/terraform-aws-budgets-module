variable "budgets_map" {
  type = map(object({
    budget = optional(object({
      budget_type       = string
      time_unit         = string
      account_id        = optional(string)
      billing_view_arn  = optional(string)
      limit_amount      = optional(string)
      limit_unit        = optional(string)
      name              = optional(string)
      name_prefix       = optional(string)
      time_period_end   = optional(string)
      time_period_start = optional(string)

      auto_adjust_data = optional(object({
        auto_adjust_type = string
        historical_options = optional(object({
          budget_adjustment_period = number
        }))
      }))

      filter_expression = optional(object({
        cost_categories = optional(object({
          key           = optional(string)
          match_options = optional(list(string))
          values        = optional(list(string))
        }))
        dimensions = optional(object({
          key           = string
          match_options = optional(list(string))
          values        = list(string)
        }))
        tags = optional(object({
          key           = optional(string)
          match_options = optional(list(string))
          values        = optional(list(string))
        }))
        and = optional(list(object({
          cost_categories = optional(object({
            key           = optional(string)
            match_options = optional(list(string))
            values        = optional(list(string))
          }))
          dimensions = optional(object({
            key           = string
            match_options = optional(list(string))
            values        = list(string)
          }))
          tags = optional(object({
            key           = optional(string)
            match_options = optional(list(string))
            values        = optional(list(string))
          }))
          and = optional(list(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          })))
          or = optional(list(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          })))
          not = optional(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          }))
        })))
        or = optional(list(object({
          cost_categories = optional(object({
            key           = optional(string)
            match_options = optional(list(string))
            values        = optional(list(string))
          }))
          dimensions = optional(object({
            key           = string
            match_options = optional(list(string))
            values        = list(string)
          }))
          tags = optional(object({
            key           = optional(string)
            match_options = optional(list(string))
            values        = optional(list(string))
          }))
          and = optional(list(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          })))
          or = optional(list(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          })))
          not = optional(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          }))
        })))
        not = optional(object({
          cost_categories = optional(object({
            key           = optional(string)
            match_options = optional(list(string))
            values        = optional(list(string))
          }))
          dimensions = optional(object({
            key           = string
            match_options = optional(list(string))
            values        = list(string)
          }))
          tags = optional(object({
            key           = optional(string)
            match_options = optional(list(string))
            values        = optional(list(string))
          }))
          and = optional(list(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          })))
          or = optional(list(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          })))
          not = optional(object({
            cost_categories = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
            dimensions = optional(object({
              key           = string
              match_options = optional(list(string))
              values        = list(string)
            }))
            tags = optional(object({
              key           = optional(string)
              match_options = optional(list(string))
              values        = optional(list(string))
            }))
          }))
        }))
      }))

      cost_filter = optional(set(object({
        name   = string
        values = list(string)
      })))

      cost_types = optional(object({
        include_credit             = optional(bool)
        include_discount           = optional(bool)
        include_other_subscription = optional(bool)
        include_recurring          = optional(bool)
        include_refund             = optional(bool)
        include_subscription       = optional(bool)
        include_support            = optional(bool)
        include_tax                = optional(bool)
        include_upfront            = optional(bool)
        use_amortized              = optional(bool)
        use_blended                = optional(bool)
      }))

      notification = optional(set(object({
        comparison_operator        = string
        threshold                  = number
        threshold_type             = string
        notification_type          = string
        subscriber_email_addresses = optional(set(string))
        subscriber_sns_topic_arns  = optional(set(string))
        topic_custom_names         = optional(set(string))
      })))

      planned_limit = optional(set(object({
        start_time = string
        amount     = string
        unit       = string
      })))

      metrics = optional(list(string))

      tags = optional(map(string))
    }))

    budget_actions = optional(map(object({
      action_type                = string
      approval_model             = string
      execution_role_arn         = optional(string)
      execution_role_custom_name = optional(string)
      notification_type          = string
      budget_name                = optional(string)
      account_id                 = optional(string)

      action_threshold = object({
        action_threshold_value = number
        action_threshold_type  = string
      })

      definition = object({
        iam_action_definition = optional(object({
          policy_arn         = optional(string)
          iam_custom_name    = optional(string)
          policy_custom_name = optional(string)
          groups             = optional(set(string))
          group_custom_names = optional(set(string))
          roles              = optional(set(string))
          role_custom_names  = optional(set(string))
          users              = optional(set(string))
          user_custom_names  = optional(set(string))
        }))

        ssm_action_definition = optional(object({
          action_sub_type = string
          instance_ids    = set(string)
          region          = string
        }))

        scp_action_definition = optional(object({
          policy_id  = string
          target_ids = set(string)
        }))
      })

      subscriber = set(object({
        address           = optional(string)
        topic_custom_name = optional(string)
        subscription_type = string
      }))

      tags = optional(map(string))

      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
        delete = optional(string)
      }))
    })), {})
  }))

  description = "Keyed collection of budgets definitions"
}

variable "sns_map" {
  type = map(object({
    topic = optional(object({
      region                                        = optional(string)
      name                                          = optional(string)
      name_prefix                                   = optional(string)
      display_name                                  = optional(string)
      policy                                        = optional(string)
      iam_custom_name                               = optional(string)
      policy_custom_name                            = optional(string)
      delivery_policy                               = optional(string)
      application_success_feedback_role_arn         = optional(string)
      application_success_feedback_role_custom_name = optional(string)
      application_success_feedback_sample_rate      = optional(number)
      application_failure_feedback_role_arn         = optional(string)
      application_failure_feedback_role_custom_name = optional(string)
      http_success_feedback_role_arn                = optional(string)
      http_success_feedback_role_custom_name        = optional(string)
      http_success_feedback_sample_rate             = optional(number)
      http_failure_feedback_role_arn                = optional(string)
      http_failure_feedback_role_custom_name        = optional(string)
      kms_master_key_id                             = optional(string)
      kms_master_key_custom_name                    = optional(string)
      replica_key_custom_name                       = optional(string)
      signature_version                             = optional(number)
      tracing_config                                = optional(string)
      fifo_topic                                    = optional(bool)
      fifo_throughput_scope                         = optional(string)
      archive_policy                                = optional(string)
      content_based_deduplication                   = optional(bool)
      lambda_success_feedback_role_arn              = optional(string)
      lambda_success_feedback_role_custom_name      = optional(string)
      lambda_success_feedback_sample_rate           = optional(number)
      lambda_failure_feedback_role_arn              = optional(string)
      lambda_failure_feedback_role_custom_name      = optional(string)
      sqs_success_feedback_role_arn                 = optional(string)
      sqs_success_feedback_role_custom_name         = optional(string)
      sqs_success_feedback_sample_rate              = optional(number)
      sqs_failure_feedback_role_arn                 = optional(string)
      sqs_failure_feedback_role_custom_name         = optional(string)
      firehose_success_feedback_role_arn            = optional(string)
      firehose_success_feedback_role_custom_name    = optional(string)
      firehose_success_feedback_sample_rate         = optional(number)
      firehose_failure_feedback_role_arn            = optional(string)
      firehose_failure_feedback_role_custom_name    = optional(string)
      tags                                          = optional(map(string))
    }))

    data_protection_policy = optional(object({
      region = optional(string)
      arn    = optional(string)
      policy = string
    }))

    policy = optional(object({
      # When arn is omitted, this manages the created topic instead of topic.policy.
      region             = optional(string)
      arn                = optional(string)
      policy             = optional(string)
      iam_custom_name    = optional(string)
      policy_custom_name = optional(string)
    }))

    subscriptions = optional(map(object({
      region                          = optional(string)
      topic_arn                       = optional(string)
      endpoint                        = string
      protocol                        = string
      subscription_role_arn           = optional(string)
      subscription_role_custom_name   = optional(string)
      confirmation_timeout_in_minutes = optional(number)
      delivery_policy                 = optional(string)
      endpoint_auto_confirms          = optional(bool)
      filter_policy                   = optional(string)
      filter_policy_scope             = optional(string)
      raw_message_delivery            = optional(bool)
      redrive_policy                  = optional(string)
      replay_policy                   = optional(string)
    })), {})

    sms_preferences = optional(object({
      # Configure only once per AWS account and Region; a topic is not required.
      region                                = optional(string)
      monthly_spend_limit                   = optional(number)
      delivery_status_iam_role_arn          = optional(string)
      delivery_status_iam_role_custom_name  = optional(string)
      delivery_status_success_sampling_rate = optional(string)
      default_sender_id                     = optional(string)
      default_sms_type                      = optional(string)
      usage_report_s3_bucket                = optional(string)
    }))

    platform_applications = optional(map(object({
      region                            = optional(string)
      name                              = string
      platform                          = string
      platform_credential               = string
      event_delivery_failure_topic_arn  = optional(string)
      event_endpoint_created_topic_arn  = optional(string)
      event_endpoint_deleted_topic_arn  = optional(string)
      event_endpoint_updated_topic_arn  = optional(string)
      failure_feedback_role_arn         = optional(string)
      failure_feedback_role_custom_name = optional(string)
      platform_principal                = optional(string)
      success_feedback_role_arn         = optional(string)
      success_feedback_role_custom_name = optional(string)
      success_feedback_sample_rate      = optional(string)
      apple_platform_team_id            = optional(string)
      apple_platform_bundle_id          = optional(string)
    })), {})
  }))

  description = "Keyed collection of sns definitions"
  default     = {}
}

variable "kms_map" {
  type = map(object({
    key = optional(object({
      region                             = optional(string)
      description                        = optional(string)
      key_usage                          = optional(string)
      custom_key_store_id                = optional(string)
      custom_key_store_custom_name       = optional(string)
      customer_master_key_spec           = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      is_enabled                         = optional(bool)
      enable_key_rotation                = optional(bool)
      rotation_period_in_days            = optional(number)
      multi_region                       = optional(bool)
      xks_key_id                         = optional(string)
      tags                               = optional(map(string))
      timeouts = optional(object({
        create = optional(string)
      }))
    }))

    external_key = optional(object({
      region                             = optional(string)
      description                        = optional(string)
      key_spec                           = optional(string)
      key_usage                          = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      key_material_base64                = optional(string)
      multi_region                       = optional(bool)
      valid_to                           = optional(string)
      tags                               = optional(map(string))
    }))

    existing_key = optional(object({
      region       = optional(string)
      key_id       = string
      grant_tokens = optional(list(string))
    }))

    aliases = optional(map(object({
      region                  = optional(string)
      name                    = optional(string)
      name_prefix             = optional(string)
      target_key_id           = optional(string)
      replica_key_custom_name = optional(string)
    })), {})

    grants = optional(map(object({
      region                                   = optional(string)
      key_id                                   = optional(string)
      replica_key_custom_name                  = optional(string)
      name                                     = optional(string)
      grantee_principal                        = optional(string)
      grantee_iam_custom_name                  = optional(string)
      grantee_role_custom_name                 = optional(string)
      grantee_user_custom_name                 = optional(string)
      grantee_service_linked_role_custom_name  = optional(string)
      operations                               = set(string)
      retiring_principal                       = optional(string)
      retiring_iam_custom_name                 = optional(string)
      retiring_role_custom_name                = optional(string)
      retiring_user_custom_name                = optional(string)
      retiring_service_linked_role_custom_name = optional(string)
      retire_on_delete                         = optional(bool)
      grant_creation_tokens                    = optional(set(string))
      constraints = optional(set(object({
        encryption_context_equals = optional(map(string))
        encryption_context_subset = optional(map(string))
      })))
    })), {})

    replica_keys = optional(map(object({
      region                             = optional(string)
      primary_key_arn                    = optional(string)
      description                        = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      tags                               = optional(map(string))
    })), {})

    replica_external_keys = optional(map(object({
      region                             = optional(string)
      primary_key_arn                    = optional(string)
      description                        = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      key_material_base64                = optional(string)
      valid_to                           = optional(string)
      tags                               = optional(map(string))
    })), {})

    key_policy = optional(object({
      region                             = optional(string)
      key_id                             = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
    }))

    custom_key_stores = optional(map(object({
      region                   = optional(string)
      custom_key_store_name    = string
      custom_key_store_type    = optional(string)
      cloud_hsm_cluster_id     = optional(string)
      key_store_password       = optional(string)
      trust_anchor_certificate = optional(string)
      xks_proxy_authentication_credential = optional(object({
        access_key_id         = string
        raw_secret_access_key = string
      }))
      xks_proxy_connectivity              = optional(string)
      xks_proxy_uri_endpoint              = optional(string)
      xks_proxy_uri_path                  = optional(string)
      xks_proxy_vpc_endpoint_service_name = optional(string)
      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
        delete = optional(string)
      }))
    })), {})

    public_key = optional(object({
      region                  = optional(string)
      key_id                  = optional(string)
      replica_key_custom_name = optional(string)
      grant_tokens            = optional(list(string))
    }))
  }))

  description = "Keyed collection of kms definitions"
  default     = {}
}

variable "iam_map" {
  type = map(object({
    account_alias = optional(object({
      account_alias = string
    }))

    account_password_policy = optional(object({
      allow_users_to_change_password = optional(bool)
      hard_expiry                    = optional(bool)
      max_password_age               = optional(number)
      minimum_password_length        = optional(number)
      password_reuse_prevention      = optional(number)
      require_lowercase_characters   = optional(bool)
      require_numbers                = optional(bool)
      require_symbols                = optional(bool)
      require_uppercase_characters   = optional(bool)
    }))

    role = optional(object({
      assume_role_policy                      = optional(string)
      assume_role_policy_document_custom_name = optional(string)
      description                             = optional(string)
      force_detach_policies                   = optional(bool)
      inline_policy = optional(set(object({
        name   = string
        policy = string
      })), [])

      managed_policy_arns              = optional(set(string))
      max_session_duration             = optional(number)
      name                             = optional(string)
      name_prefix                      = optional(string)
      path                             = optional(string)
      permissions_boundary             = optional(string)
      permissions_boundary_custom_name = optional(string)

      tags = optional(map(string))
    }))

    policy_documents = optional(map(object({
      override_policy_documents = optional(list(string))
      policy_id                 = optional(string)
      source_policy_documents   = optional(list(string))
      policy_version            = optional(string)

      statement = optional(list(object({
        actions       = optional(set(string))
        effect        = optional(string)
        not_actions   = optional(set(string))
        not_resources = optional(set(string))
        resources     = optional(set(string))
        sid           = optional(string)

        condition = optional(set(object({
          test     = string
          variable = string
          values   = list(any)
        })), [])

        principals = optional(set(object({
          identifiers                = set(string)
          saml_provider_custom_names = optional(set(string), [])
          type                       = string
        })), [])

        not_principals = optional(set(object({
          identifiers                = set(string)
          saml_provider_custom_names = optional(set(string), [])
          type                       = string
        })), [])
      })), [])
    })), {})

    role_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      role                        = optional(string)
    })), {})

    role_policy_attachments = optional(list(object({
      custom_name        = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
      role               = optional(string)
    })), [])

    role_policies_exclusive = optional(object({
      role_name           = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    }))

    instance_profile = optional(object({
      name        = optional(string)
      name_prefix = optional(string)
      path        = optional(string)
      role        = optional(string)
      tags        = optional(map(string))
    }))

    policy_attachments_exclusive = optional(object({
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
      role_name           = optional(string)
    }))

    policies = optional(map(object({
      policy                            = optional(string)
      policy_custom_name                = optional(string)
      delay_after_policy_creation_in_ms = optional(number)
      description                       = optional(string)
      name                              = optional(string)
      name_prefix                       = optional(string)
      path                              = optional(string)
      tags                              = optional(map(string))
    })), {})

    users = optional(map(object({
      name                             = string
      path                             = optional(string)
      permissions_boundary             = optional(string)
      permissions_boundary_custom_name = optional(string)
      force_destroy                    = optional(bool)
      tags                             = optional(map(string))
    })), {})

    user_login_profiles = optional(map(object({
      user                    = optional(string)
      user_custom_name        = optional(string)
      pgp_key                 = optional(string)
      password_length         = optional(number)
      password_reset_required = optional(bool)
    })), {})

    access_keys = optional(map(object({
      user             = optional(string)
      user_custom_name = optional(string)
      pgp_key          = optional(string)
      status           = optional(string)
    })), {})

    user_ssh_keys = optional(map(object({
      username         = optional(string)
      user_custom_name = optional(string)
      encoding         = string
      public_key       = string
      status           = optional(string)
    })), {})

    groups = optional(map(object({
      name = string
      path = optional(string)
    })), {})

    user_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      user                        = optional(string)
      user_custom_name            = optional(string)
    })), {})

    user_policy_attachments = optional(map(object({
      user               = optional(string)
      user_custom_name   = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
    })), {})

    user_policies_exclusive = optional(map(object({
      user_name           = optional(string)
      user_custom_name    = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    user_policy_attachments_exclusive = optional(map(object({
      user_name           = optional(string)
      user_custom_name    = optional(string)
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      group                       = optional(string)
      group_custom_name           = optional(string)
    })), {})

    group_policy_attachments = optional(map(object({
      group              = optional(string)
      group_custom_name  = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
    })), {})

    group_policies_exclusive = optional(map(object({
      group_name          = optional(string)
      group_custom_name   = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_policy_attachments_exclusive = optional(map(object({
      group_name          = optional(string)
      group_custom_name   = optional(string)
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_memberships = optional(map(object({
      name              = string
      users             = set(string)
      user_custom_names = optional(set(string), [])
      group             = optional(string)
      group_custom_name = optional(string)
    })), {})

    user_group_memberships = optional(map(object({
      user   = optional(string)
      groups = optional(set(string), [])
    })), {})

    openid_connect_providers = optional(map(object({
      url             = string
      client_id_list  = set(string)
      thumbprint_list = optional(list(string))
      tags            = optional(map(string))
    })), {})

    saml_providers = optional(map(object({
      name                   = string
      saml_metadata_document = string
      tags                   = optional(map(string))
    })), {})

    service_linked_roles = optional(map(object({
      aws_service_name = string
      custom_suffix    = optional(string)
      description      = optional(string)
      tags             = optional(map(string))
    })), {})
  }))

  description = "Keyed collection of iam definitions"
  default     = {}
}
