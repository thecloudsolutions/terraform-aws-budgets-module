module "budgets" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-budgets-component.git?ref=main"

  budgets_map = { for key, budgets in var.budgets_map :
    key => merge(budgets,
      {
        budget = try(budgets.budget, null) != null ? merge(budgets.budget,
          {
            notification = budgets.budget.notification != null ? [for notification in budgets.budget.notification :
              merge(notification,
                { subscriber_sns_topic_arns = try(notification.subscriber_sns_topic_arns, null) != null ? notification.subscriber_sns_topic_arns : try(notification.topic_custom_names, null) != null ? [for topic in notification.topic_custom_names : module.sns.sns_topic_arns[topic]] : null }
              )
            ] : null
          }
        ) : null

        budget_actions = { for action_key, action in budgets.budget_actions :
          action_key => merge(action,
            {
              execution_role_arn = try(action.execution_role_arn, null) != null ? action.execution_role_arn : try(action.execution_role_custom_name, null) != null ? module.iam.iam_role_arns[action.execution_role_custom_name] : null

              definition = merge(action.definition,
                {
                  iam_action_definition = try(action.definition.iam_action_definition, null) != null ? merge(action.definition.iam_action_definition,
                    {
                      policy_arn = try(action.definition.iam_action_definition.policy_arn, null) != null ? action.definition.iam_action_definition.policy_arn : try(action.definition.iam_action_definition.policy_custom_name, null) != null ? module.iam.iam_policy_arns[action.definition.iam_action_definition.iam_custom_name][action.definition.iam_action_definition.policy_custom_name] : null
                      groups     = try(action.definition.iam_action_definition.groups, null) != null ? action.definition.iam_action_definition.groups : try(action.definition.iam_action_definition.group_custom_names, null) != null ? [for group in action.definition.iam_action_definition.group_custom_names : module.iam.iam_group_names[action.definition.iam_action_definition.iam_custom_name][group]] : null
                      roles      = try(action.definition.iam_action_definition.roles, null) != null ? action.definition.iam_action_definition.roles : try(action.definition.iam_action_definition.role_custom_names, null) != null ? [for role in action.definition.iam_action_definition.role_custom_names : module.iam.iam_role_names[role]] : null
                      users      = try(action.definition.iam_action_definition.users, null) != null ? action.definition.iam_action_definition.users : try(action.definition.iam_action_definition.user_custom_names, null) != null ? [for user in action.definition.iam_action_definition.user_custom_names : module.iam.iam_user_names[action.definition.iam_action_definition.iam_custom_name][user]] : null
                    }
                  ) : null
                }
              )

              subscriber = [for subscriber in action.subscriber :
                merge(subscriber,
                  { address = try(subscriber.address, null) != null ? subscriber.address : subscriber.subscription_type == "SNS" && try(subscriber.topic_custom_name, null) != null ? module.sns.sns_topic_arns[subscriber.topic_custom_name] : null }
                )
              ]
            }
          )
        }
      }
    )
  }

  depends_on = [module.sns, module.kms, module.iam]
}

module "sns" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-sns-component.git?ref=main"

  sns_map = { for key, topic in var.sns_map :
    key => merge(topic,
      {
        topic = try(topic.topic, null) != null ? merge(topic.topic,
          {
            kms_master_key_id                     = try(topic.topic.kms_master_key_id, null) != null ? topic.topic.kms_master_key_id : try(topic.topic.replica_key_custom_name, null) != null ? try(module.kms.kms_replica_external_key_arns[topic.topic.kms_master_key_custom_name][topic.topic.replica_key_custom_name], module.kms.kms_replica_key_arns[topic.topic.kms_master_key_custom_name][topic.topic.replica_key_custom_name]) : try(topic.topic.kms_master_key_custom_name, null) != null ? module.kms.kms_key_arns[topic.topic.kms_master_key_custom_name] : null
            policy                                = try(topic.topic.policy, null) != null ? topic.topic.policy : try(topic.topic.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[topic.topic.iam_custom_name][topic.topic.policy_custom_name] : null
            application_success_feedback_role_arn = try(topic.topic.application_success_feedback_role_arn, null) != null ? topic.topic.application_success_feedback_role_arn : try(topic.topic.application_success_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.application_success_feedback_role_custom_name] : null
            application_failure_feedback_role_arn = try(topic.topic.application_failure_feedback_role_arn, null) != null ? topic.topic.application_failure_feedback_role_arn : try(topic.topic.application_failure_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.application_failure_feedback_role_custom_name] : null
            http_success_feedback_role_arn        = try(topic.topic.http_success_feedback_role_arn, null) != null ? topic.topic.http_success_feedback_role_arn : try(topic.topic.http_success_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.http_success_feedback_role_custom_name] : null
            http_failure_feedback_role_arn        = try(topic.topic.http_failure_feedback_role_arn, null) != null ? topic.topic.http_failure_feedback_role_arn : try(topic.topic.http_failure_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.http_failure_feedback_role_custom_name] : null
            lambda_success_feedback_role_arn      = try(topic.topic.lambda_success_feedback_role_arn, null) != null ? topic.topic.lambda_success_feedback_role_arn : try(topic.topic.lambda_success_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.lambda_success_feedback_role_custom_name] : null
            lambda_failure_feedback_role_arn      = try(topic.topic.lambda_failure_feedback_role_arn, null) != null ? topic.topic.lambda_failure_feedback_role_arn : try(topic.topic.lambda_failure_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.lambda_failure_feedback_role_custom_name] : null
            sqs_success_feedback_role_arn         = try(topic.topic.sqs_success_feedback_role_arn, null) != null ? topic.topic.sqs_success_feedback_role_arn : try(topic.topic.sqs_success_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.sqs_success_feedback_role_custom_name] : null
            sqs_failure_feedback_role_arn         = try(topic.topic.sqs_failure_feedback_role_arn, null) != null ? topic.topic.sqs_failure_feedback_role_arn : try(topic.topic.sqs_failure_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.sqs_failure_feedback_role_custom_name] : null
            firehose_success_feedback_role_arn    = try(topic.topic.firehose_success_feedback_role_arn, null) != null ? topic.topic.firehose_success_feedback_role_arn : try(topic.topic.firehose_success_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.firehose_success_feedback_role_custom_name] : null
            firehose_failure_feedback_role_arn    = try(topic.topic.firehose_failure_feedback_role_arn, null) != null ? topic.topic.firehose_failure_feedback_role_arn : try(topic.topic.firehose_failure_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.topic.firehose_failure_feedback_role_custom_name] : null
          }
        ) : null

        policy = try(topic.policy, null) != null ? merge(topic.policy,
          { policy = try(topic.policy.policy, null) != null ? topic.policy.policy : try(topic.policy.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[topic.policy.iam_custom_name][topic.policy.policy_custom_name] : null }
        ) : null

        subscriptions = { for subscription_key, subscription in topic.subscriptions :
          subscription_key => merge(subscription,
            { subscription_role_arn = try(subscription.subscription_role_arn, null) != null ? subscription.subscription_role_arn : try(subscription.subscription_role_custom_name, null) != null ? module.iam.iam_role_arns[subscription.subscription_role_custom_name] : null }
          )
        }

        sms_preferences = try(topic.sms_preferences, null) != null ? merge(topic.sms_preferences,
          { delivery_status_iam_role_arn = try(topic.sms_preferences.delivery_status_iam_role_arn, null) != null ? topic.sms_preferences.delivery_status_iam_role_arn : try(topic.sms_preferences.delivery_status_iam_role_custom_name, null) != null ? module.iam.iam_role_arns[topic.sms_preferences.delivery_status_iam_role_custom_name] : null }
        ) : null

        platform_applications = { for platform_application_key, platform_application in topic.platform_applications :
          platform_application_key => merge(platform_application,
            {
              failure_feedback_role_arn = try(platform_application.failure_feedback_role_arn, null) != null ? platform_application.failure_feedback_role_arn : try(platform_application.failure_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[platform_application.failure_feedback_role_custom_name] : null
              success_feedback_role_arn = try(platform_application.success_feedback_role_arn, null) != null ? platform_application.success_feedback_role_arn : try(platform_application.success_feedback_role_custom_name, null) != null ? module.iam.iam_role_arns[platform_application.success_feedback_role_custom_name] : null
            }
          )
        }
      }
    )
  }

  depends_on = [module.kms, module.iam]
}

module "kms" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-kms-component.git?ref=main"

  kms_map = { for key, kms in var.kms_map :
    key => merge(kms,
      {
        key = try(kms.key, null) != null ? merge(kms.key,
          { policy = try(kms.key.policy, null) != null ? kms.key.policy : try(kms.key.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[kms.key.iam_custom_name][kms.key.policy_custom_name] : null }
        ) : null

        external_key = try(kms.external_key, null) != null ? merge(kms.external_key,
          { policy = try(kms.external_key.policy, null) != null ? kms.external_key.policy : try(kms.external_key.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[kms.external_key.iam_custom_name][kms.external_key.policy_custom_name] : null }
        ) : null

        grants = { for grant_key, grant in kms.grants :
          grant_key => merge(grant,
            {
              grantee_principal  = try(grant.grantee_principal, null) != null ? grant.grantee_principal : try(grant.grantee_role_custom_name, null) != null ? module.iam.iam_role_arns[grant.grantee_role_custom_name] : try(grant.grantee_user_custom_name, null) != null ? module.iam.iam_user_arns[grant.grantee_iam_custom_name][grant.grantee_user_custom_name] : try(grant.grantee_service_linked_role_custom_name, null) != null ? module.iam.iam_service_linked_role_arns[grant.grantee_iam_custom_name][grant.grantee_service_linked_role_custom_name] : null
              retiring_principal = try(grant.retiring_principal, null) != null ? grant.retiring_principal : try(grant.retiring_role_custom_name, null) != null ? module.iam.iam_role_arns[grant.retiring_role_custom_name] : try(grant.retiring_user_custom_name, null) != null ? module.iam.iam_user_arns[grant.retiring_iam_custom_name][grant.retiring_user_custom_name] : try(grant.retiring_service_linked_role_custom_name, null) != null ? module.iam.iam_service_linked_role_arns[grant.retiring_iam_custom_name][grant.retiring_service_linked_role_custom_name] : null
            }
          )
        }

        replica_keys = { for replica_key, replica in kms.replica_keys :
          replica_key => merge(replica,
            { policy = try(replica.policy, null) != null ? replica.policy : try(replica.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[replica.iam_custom_name][replica.policy_custom_name] : null }
          )
        }

        replica_external_keys = { for replica_key, replica in kms.replica_external_keys :
          replica_key => merge(replica,
            { policy = try(replica.policy, null) != null ? replica.policy : try(replica.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[replica.iam_custom_name][replica.policy_custom_name] : null }
          )
        }

        key_policy = try(kms.key_policy, null) != null ? merge(kms.key_policy,
          { policy = try(kms.key_policy.policy, null) != null ? kms.key_policy.policy : try(kms.key_policy.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[kms.key_policy.iam_custom_name][kms.key_policy.policy_custom_name] : null }
        ) : null
      }
    )
  }
}

module "iam" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-iam-component.git?ref=main"

  iam_map = var.iam_map
}
