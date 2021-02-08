# README
Main Branch
![GitHub package.json version (branch)](https://img.shields.io/github/package-json/v/RYLabs/rails-starter/main)
![CircleCI](https://img.shields.io/circleci/build/github/RYLabs/rails-starter/main?label=Main%20build%20and%20test&token=5f9d661df58dd05f6fb430075d02e445daaecc96)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


new action setup payment intent and attach that to create 



Started POST "/subscription" for 127.0.0.1 at 2021-01-27 22:11:54 +0800
Processing by SubscriptionsController#create as HTML
  Parameters: {"authenticity_token"=>"gDOTqOhM3qikE8ncpiu/T9p93BMridTSyrx/5YWM9f74HmAS0A/XjgF2YBbeq33H7bk8JSDO76rYfGq6rc1biA==", "processor"=>"stripe", "card_token"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O"}
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 ORDER BY "users"."id" ASC LIMIT $2  [["id", 4], ["LIMIT", 1]]
Unpermitted parameters: :authenticity_token, :processor
  IndividualAccount Load (0.1ms)  SELECT "accounts".* FROM "accounts" WHERE "accounts"."type" = $1 AND "accounts"."user_id" = $2 LIMIT $3  [["type", "IndividualAccount"], ["user_id", 4], ["LIMIT", 1]]
  ↳ app/controllers/subscriptions_controller.rb:52:in `user_subscribed?'
  Pay::Subscription Load (0.2ms)  SELECT "pay_subscriptions".* FROM "pay_subscriptions" WHERE "pay_subscriptions"."owner_id" = $1 AND "pay_subscriptions"."owner_type" = $2 AND "pay_subscriptions"."name" = $3 ORDER BY "pay_subscriptions"."id" DESC LIMIT $4  [["owner_id", 4], ["owner_type", "BaseAccount"], ["name", "default"], ["LIMIT", 1]]
  ↳ app/controllers/subscriptions_controller.rb:52:in `user_subscribed?'
  CACHE Pay::Subscription Load (0.0ms)  SELECT "pay_subscriptions".* FROM "pay_subscriptions" WHERE "pay_subscriptions"."owner_id" = $1 AND "pay_subscriptions"."owner_type" = $2 AND "pay_subscriptions"."name" = $3 ORDER BY "pay_subscriptions"."id" DESC LIMIT $4  [["owner_id", 4], ["owner_type", "BaseAccount"], ["name", "default"], ["LIMIT", 1]]
  ↳ app/policies/subscription_policy.rb:13:in `create?'
Unpermitted parameters: :authenticity_token, :processor
   (0.1ms)  BEGIN
  ↳ app/services/stripe_subscription.rb:21:in `ensure_user_stripe_account'
  IndividualAccount Update (0.2ms)  UPDATE "accounts" SET "processor" = $1, "slug" = $2, "name" = $3, "updated_at" = $4 WHERE "accounts"."id" = $5  [["processor", "stripe"], ["slug", "c73406f3-8455-4e35-a682-893a92e9c5e0"], ["name", "c73406f3-8455-4e35-a682-893a92e9c5e0"], ["updated_at", "2021-01-27 14:11:54.359008"], ["id", 4]]
  ↳ app/services/stripe_subscription.rb:21:in `ensure_user_stripe_account'
   (7.4ms)  COMMIT
  ↳ app/services/stripe_subscription.rb:21:in `ensure_user_stripe_account'
   (0.2ms)  BEGIN
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'
  IndividualAccount Update (0.3ms)  UPDATE "accounts" SET "processor_id" = $1, "slug" = $2, "name" = $3, "updated_at" = $4 WHERE "accounts"."id" = $5  [["processor_id", "cus_IpuZZU5oNMB8bP"], ["slug", "62f936e6-73eb-43be-b548-5277e7790f9f"], ["name", "62f936e6-73eb-43be-b548-5277e7790f9f"], ["updated_at", "2021-01-27 14:11:54.913400"], ["id", 4]]
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'
   (0.6ms)  COMMIT
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'



















Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:11:55 +0800
Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkQIvmPrtU2SF07j12CbL", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756714, "data"=>{"object"=>{"id"=>"cus_IpuZZU5oNMB8bP", "object"=>"customer", "account_balance"=>0, "address"=>nil, "balance"=>0, "created"=>1611756714, "currency"=>nil, "default_source"=>nil, "delinquent"=>false, "description"=>nil, "discount"=>nil, "email"=>"test@test.com", "invoice_prefix"=>"BE2459C1", "invoice_settings"=>{"custom_fields"=>nil, "default_payment_method"=>nil, "footer"=>nil}, "livemode"=>false, "metadata"=>{}, "name"=>nil, "next_invoice_sequence"=>1, "phone"=>nil, "preferred_locales"=>[], "shipping"=>nil, "sources"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/sources"}, "subscriptions"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/subscriptions"}, "tax_exempt"=>"none", "tax_ids"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/tax_ids"}, "tax_info"=>nil, "tax_info_verification"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_3upJ65u3Evs9G5", "type"=>"customer.created", "webhook"=>{"id"=>"evt_1IEEkQIvmPrtU2SF07j12CbL", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756714, "data"=>{"object"=>{"id"=>"cus_IpuZZU5oNMB8bP", "object"=>"customer", "account_balance"=>0, "address"=>nil, "balance"=>0, "created"=>1611756714, "currency"=>nil, "default_source"=>nil, "delinquent"=>false, "description"=>nil, "discount"=>nil, "email"=>"test@test.com", "invoice_prefix"=>"BE2459C1", "invoice_settings"=>{"custom_fields"=>nil, "default_payment_method"=>nil, "footer"=>nil}, "livemode"=>false, "metadata"=>{}, "name"=>nil, "next_invoice_sequence"=>1, "phone"=>nil, "preferred_locales"=>[], "shipping"=>nil, "sources"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/sources"}, "subscriptions"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/subscriptions"}, "tax_exempt"=>"none", "tax_ids"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/tax_ids"}, "tax_info"=>nil, "tax_info_verification"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_3upJ65u3Evs9G5", "type"=>"customer.created"}}
Completed 200 OK in 1ms (ActiveRecord: 0.0ms | Allocations: 1624)




























Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:11:56 +0800
Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkRIvmPrtU2SFCKiLrykh", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756715, "data"=>{"object"=>{"id"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "object"=>"payment_method", "billing_details"=>{"address"=>{"city"=>nil, "country"=>nil, "line1"=>nil, "line2"=>nil, "postal_code"=>"42424", "state"=>nil}, "email"=>nil, "name"=>"Test User", "phone"=>nil}, "card"=>{"brand"=>"visa", "checks"=>{"address_line1_check"=>nil, "address_postal_code_check"=>"pass", "cvc_check"=>"pass"}, "country"=>"US", "exp_month"=>4, "exp_year"=>2024, "fingerprint"=>"35xZD7Xp6NuDTryN", "funding"=>"credit", "generated_from"=>nil, "last4"=>"4242", "networks"=>{"available"=>["visa"], "preferred"=>nil}, "three_d_secure_usage"=>{"supported"=>true}, "wallet"=>nil}, "created"=>1611756714, "customer"=>"cus_IpuZZU5oNMB8bP", "livemode"=>false, "metadata"=>{}, "type"=>"card"}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_odZuKKgBlsI2ID", "type"=>"payment_method.attached", "webhook"=>{"id"=>"evt_1IEEkRIvmPrtU2SFCKiLrykh", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756715, "data"=>{"object"=>{"id"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "object"=>"payment_method", "billing_details"=>{"address"=>{"city"=>nil, "country"=>nil, "line1"=>nil, "line2"=>nil, "postal_code"=>"42424", "state"=>nil}, "email"=>nil, "name"=>"Test User", "phone"=>nil}, "card"=>{"brand"=>"visa", "checks"=>{"address_line1_check"=>nil, "address_postal_code_check"=>"pass", "cvc_check"=>"pass"}, "country"=>"US", "exp_month"=>4, "exp_year"=>2024, "fingerprint"=>"35xZD7Xp6NuDTryN", "funding"=>"credit", "generated_from"=>nil, "last4"=>"4242", "networks"=>{"available"=>["visa"], "preferred"=>nil}, "three_d_secure_usage"=>{"supported"=>true}, "wallet"=>nil}, "created"=>1611756714, "customer"=>"cus_IpuZZU5oNMB8bP", "livemode"=>false, "metadata"=>{}, "type"=>"card"}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_odZuKKgBlsI2ID", "type"=>"payment_method.attached"}}
  IndividualAccount Load (1.0ms)  SELECT "accounts".* FROM "accounts" WHERE "accounts"."type" = $1 AND "accounts"."processor" = $2 AND "accounts"."processor_id" = $3 LIMIT $4  [["type", "IndividualAccount"], ["processor", "stripe"], ["processor_id", "cus_IpuZZU5oNMB8bP"], ["LIMIT", 1]]
Completed 500 Internal Server Error in 12ms (ActiveRecord: 1.0ms | Allocations: 3753)


  
ActiveRecord::SubclassNotFound (Invalid single-table inheritance type: IndividualAccount is not a subclass of IndividualAccount):
  
activerecord (6.0.3.4) lib/active_record/inheritance.rb:241:in `find_sti_class'
activerecord (6.0.3.4) lib/active_record/inheritance.rb:215:in `discriminate_class_for_record'
activerecord (6.0.3.4) lib/active_record/persistence.rb:257:in `instantiate'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `block (2 levels) in find_by_sql'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `block in each'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `each'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `each'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `map'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `block in find_by_sql'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
activerecord (6.0.3.4) lib/active_record/querying.rb:56:in `find_by_sql'
activerecord (6.0.3.4) lib/active_record/relation.rb:821:in `block in exec_queries'
activerecord (6.0.3.4) lib/active_record/relation.rb:839:in `skip_query_cache_if_necessary'
activerecord (6.0.3.4) lib/active_record/relation.rb:808:in `exec_queries'
activerecord (6.0.3.4) lib/active_record/relation.rb:626:in `load'
activerecord (6.0.3.4) lib/active_record/relation.rb:250:in `records'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:499:in `find_take'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:98:in `take'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:81:in `find_by'
activerecord (6.0.3.4) lib/active_record/querying.rb:21:in `find_by'
activerecord (6.0.3.4) lib/active_record/core.rb:183:in `find_by'
pay (2.4.2) lib/pay.rb:69:in `block in find_billable'
pay (2.4.2) lib/pay.rb:68:in `each'
pay (2.4.2) lib/pay.rb:68:in `find_billable'
pay (2.4.2) lib/pay/stripe/webhooks/payment_method_updated.rb:7:in `call'
stripe_event (2.3.1) lib/stripe_event.rb:63:in `call'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:189:in `finish'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `block in finish'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `each'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `finish'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:45:in `finish_with_state'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:30:in `instrument'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `instrument'
stripe_event (2.3.1) lib/stripe_event.rb:18:in `instrument'
stripe_event (2.3.1) app/controllers/stripe_event/webhook_controller.rb:8:in `event'
actionpack (6.0.3.4) lib/action_controller/metal/basic_implicit_render.rb:6:in `send_action'
actionpack (6.0.3.4) lib/abstract_controller/base.rb:195:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/rendering.rb:30:in `process_action'
actionpack (6.0.3.4) lib/abstract_controller/callbacks.rb:42:in `block in process_action'
activesupport (6.0.3.4) lib/active_support/callbacks.rb:135:in `run_callbacks'
actionpack (6.0.3.4) lib/abstract_controller/callbacks.rb:41:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/rescue.rb:22:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/instrumentation.rb:33:in `block in process_action'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `block in instrument'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `instrument'
actionpack (6.0.3.4) lib/action_controller/metal/instrumentation.rb:32:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/params_wrapper.rb:245:in `process_action'
activerecord (6.0.3.4) lib/active_record/railties/controller_runtime.rb:27:in `process_action'
actionpack (6.0.3.4) lib/abstract_controller/base.rb:136:in `process'
actionview (6.0.3.4) lib/action_view/rendering.rb:39:in `process'
actionpack (6.0.3.4) lib/action_controller/metal.rb:190:in `dispatch'
actionpack (6.0.3.4) lib/action_controller/metal.rb:254:in `dispatch'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:50:in `dispatch'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:33:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:49:in `block in serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `each'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:834:in `call'
railties (6.0.3.4) lib/rails/engine.rb:527:in `call'
railties (6.0.3.4) lib/rails/railtie.rb:190:in `public_send'
railties (6.0.3.4) lib/rails/railtie.rb:190:in `method_missing'
actionpack (6.0.3.4) lib/action_dispatch/routing/mapper.rb:19:in `block in <class:Constraints>'
actionpack (6.0.3.4) lib/action_dispatch/routing/mapper.rb:48:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:49:in `block in serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `each'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:834:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware/token_dispatcher.rb:20:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware/revocation_manager.rb:21:in `call'
rack (2.2.3) lib/rack/builder.rb:244:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware.rb:23:in `call'
warden (1.2.9) lib/warden/manager.rb:36:in `block in call'
warden (1.2.9) lib/warden/manager.rb:34:in `catch'
warden (1.2.9) lib/warden/manager.rb:34:in `call'
rack (2.2.3) lib/rack/tempfile_reaper.rb:15:in `call'
rack (2.2.3) lib/rack/etag.rb:27:in `call'
rack (2.2.3) lib/rack/conditional_get.rb:40:in `call'
rack (2.2.3) lib/rack/head.rb:12:in `call'
actionpack (6.0.3.4) lib/action_dispatch/http/content_security_policy.rb:18:in `call'
rack (2.2.3) lib/rack/session/abstract/id.rb:266:in `context'
rack (2.2.3) lib/rack/session/abstract/id.rb:260:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/cookies.rb:648:in `call'
activerecord (6.0.3.4) lib/active_record/migration.rb:567:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/callbacks.rb:27:in `block in call'
activesupport (6.0.3.4) lib/active_support/callbacks.rb:101:in `run_callbacks'
actionpack (6.0.3.4) lib/action_dispatch/middleware/callbacks.rb:26:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/executor.rb:14:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/debug_exceptions.rb:32:in `call'
web-console (4.1.0) lib/web_console/middleware.rb:132:in `call_app'
web-console (4.1.0) lib/web_console/middleware.rb:28:in `block in call'
web-console (4.1.0) lib/web_console/middleware.rb:17:in `catch'
web-console (4.1.0) lib/web_console/middleware.rb:17:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
railties (6.0.3.4) lib/rails/rack/logger.rb:37:in `call_app'
railties (6.0.3.4) lib/rails/rack/logger.rb:26:in `block in call'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:80:in `block in tagged'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:28:in `tagged'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:80:in `tagged'
railties (6.0.3.4) lib/rails/rack/logger.rb:26:in `call'
sprockets-rails (3.2.2) lib/sprockets/rails/quiet_assets.rb:13:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/remote_ip.rb:81:in `call'
request_store (1.5.0) lib/request_store/middleware.rb:19:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/request_id.rb:27:in `call'
rack (2.2.3) lib/rack/method_override.rb:24:in `call'
rack (2.2.3) lib/rack/runtime.rb:22:in `call'
activesupport (6.0.3.4) lib/active_support/cache/strategy/local_cache_middleware.rb:29:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/executor.rb:14:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/static.rb:126:in `call'
rack (2.2.3) lib/rack/sendfile.rb:110:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/host_authorization.rb:82:in `call'
webpacker (4.3.0) lib/webpacker/dev_server_proxy.rb:23:in `perform_request'
rack-proxy (0.6.5) lib/rack/proxy.rb:57:in `call'
railties (6.0.3.4) lib/rails/engine.rb:527:in `call'
puma (4.3.7) lib/puma/configuration.rb:228:in `call'
puma (4.3.7) lib/puma/server.rb:713:in `handle_request'
puma (4.3.7) lib/puma/server.rb:472:in `process_client'
puma (4.3.7) lib/puma/server.rb:328:in `block in run'
puma (4.3.7) lib/puma/thread_pool.rb:134:in `block in spawn_thread'
   (0.6ms)  BEGIN
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'
  IndividualAccount Update (1.1ms)  UPDATE "accounts" SET "slug" = $1, "name" = $2, "updated_at" = $3, "card_type" = $4, "card_last4" = $5, "card_exp_month" = $6, "card_exp_year" = $7 WHERE "accounts"."id" = $8  [["slug", "46cd9ebe-6840-4569-870d-72be576989d4"], ["name", "46cd9ebe-6840-4569-870d-72be576989d4"], ["updated_at", "2021-01-27 14:11:56.681210"], ["card_type", "Visa"], ["card_last4", "4242"], ["card_exp_month", "4"], ["card_exp_year", "2024"], ["id", 4]]
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'
   (1.1ms)  COMMIT
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'
Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:11:56 +0800
Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkSIvmPrtU2SFKxcceAzu", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756716, "data"=>{"object"=>{"id"=>"cus_IpuZZU5oNMB8bP", "object"=>"customer", "account_balance"=>0, "address"=>nil, "balance"=>0, "created"=>1611756714, "currency"=>nil, "default_source"=>nil, "delinquent"=>false, "description"=>nil, "discount"=>nil, "email"=>"test@test.com", "invoice_prefix"=>"BE2459C1", "invoice_settings"=>{"custom_fields"=>nil, "default_payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "footer"=>nil}, "livemode"=>false, "metadata"=>{}, "name"=>nil, "next_invoice_sequence"=>1, "phone"=>nil, "preferred_locales"=>[], "shipping"=>nil, "sources"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/sources"}, "subscriptions"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/subscriptions"}, "tax_exempt"=>"none", "tax_ids"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/tax_ids"}, "tax_info"=>nil, "tax_info_verification"=>nil}, "previous_attributes"=>{"invoice_settings"=>{"default_payment_method"=>nil}}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_mgbOD44FvwKZSC", "type"=>"customer.updated", "webhook"=>{"id"=>"evt_1IEEkSIvmPrtU2SFKxcceAzu", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756716, "data"=>{"object"=>{"id"=>"cus_IpuZZU5oNMB8bP", "object"=>"customer", "account_balance"=>0, "address"=>nil, "balance"=>0, "created"=>1611756714, "currency"=>nil, "default_source"=>nil, "delinquent"=>false, "description"=>nil, "discount"=>nil, "email"=>"test@test.com", "invoice_prefix"=>"BE2459C1", "invoice_settings"=>{"custom_fields"=>nil, "default_payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "footer"=>nil}, "livemode"=>false, "metadata"=>{}, "name"=>nil, "next_invoice_sequence"=>1, "phone"=>nil, "preferred_locales"=>[], "shipping"=>nil, "sources"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/sources"}, "subscriptions"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/subscriptions"}, "tax_exempt"=>"none", "tax_ids"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/tax_ids"}, "tax_info"=>nil, "tax_info_verification"=>nil}, "previous_attributes"=>{"invoice_settings"=>{"default_payment_method"=>nil}}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_mgbOD44FvwKZSC", "type"=>"customer.updated"}}
  IndividualAccount Load (0.9ms)  SELECT "accounts".* FROM "accounts" WHERE "accounts"."type" = $1 AND "accounts"."processor" = $2 AND "accounts"."processor_id" = $3 LIMIT $4  [["type", "IndividualAccount"], ["processor", "stripe"], ["processor_id", "cus_IpuZZU5oNMB8bP"], ["LIMIT", 1]]
Completed 500 Internal Server Error in 11ms (ActiveRecord: 0.9ms | Allocations: 3939)


  
ActiveRecord::SubclassNotFound (Invalid single-table inheritance type: IndividualAccount is not a subclass of IndividualAccount):
  
activerecord (6.0.3.4) lib/active_record/inheritance.rb:241:in `find_sti_class'
activerecord (6.0.3.4) lib/active_record/inheritance.rb:215:in `discriminate_class_for_record'
activerecord (6.0.3.4) lib/active_record/persistence.rb:257:in `instantiate'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `block (2 levels) in find_by_sql'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `block in each'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `each'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `each'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `map'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `block in find_by_sql'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
activerecord (6.0.3.4) lib/active_record/querying.rb:56:in `find_by_sql'
activerecord (6.0.3.4) lib/active_record/relation.rb:821:in `block in exec_queries'
activerecord (6.0.3.4) lib/active_record/relation.rb:839:in `skip_query_cache_if_necessary'
activerecord (6.0.3.4) lib/active_record/relation.rb:808:in `exec_queries'
activerecord (6.0.3.4) lib/active_record/relation.rb:626:in `load'
activerecord (6.0.3.4) lib/active_record/relation.rb:250:in `records'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:499:in `find_take'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:98:in `take'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:81:in `find_by'
activerecord (6.0.3.4) lib/active_record/querying.rb:21:in `find_by'
activerecord (6.0.3.4) lib/active_record/core.rb:183:in `find_by'
pay (2.4.2) lib/pay.rb:69:in `block in find_billable'
pay (2.4.2) lib/pay.rb:68:in `each'
pay (2.4.2) lib/pay.rb:68:in `find_billable'
pay (2.4.2) lib/pay/stripe/webhooks/customer_updated.rb:7:in `call'
stripe_event (2.3.1) lib/stripe_event.rb:63:in `call'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:189:in `finish'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `block in finish'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `each'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `finish'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:45:in `finish_with_state'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:30:in `instrument'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `instrument'
stripe_event (2.3.1) lib/stripe_event.rb:18:in `instrument'
stripe_event (2.3.1) app/controllers/stripe_event/webhook_controller.rb:8:in `event'
actionpack (6.0.3.4) lib/action_controller/metal/basic_implicit_render.rb:6:in `send_action'
actionpack (6.0.3.4) lib/abstract_controller/base.rb:195:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/rendering.rb:30:in `process_action'
actionpack (6.0.3.4) lib/abstract_controller/callbacks.rb:42:in `block in process_action'
activesupport (6.0.3.4) lib/active_support/callbacks.rb:135:in `run_callbacks'
actionpack (6.0.3.4) lib/abstract_controller/callbacks.rb:41:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/rescue.rb:22:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/instrumentation.rb:33:in `block in process_action'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `block in instrument'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `instrument'
actionpack (6.0.3.4) lib/action_controller/metal/instrumentation.rb:32:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/params_wrapper.rb:245:in `process_action'
activerecord (6.0.3.4) lib/active_record/railties/controller_runtime.rb:27:in `process_action'
actionpack (6.0.3.4) lib/abstract_controller/base.rb:136:in `process'
actionview (6.0.3.4) lib/action_view/rendering.rb:39:in `process'
actionpack (6.0.3.4) lib/action_controller/metal.rb:190:in `dispatch'
actionpack (6.0.3.4) lib/action_controller/metal.rb:254:in `dispatch'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:50:in `dispatch'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:33:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:49:in `block in serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `each'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:834:in `call'
railties (6.0.3.4) lib/rails/engine.rb:527:in `call'
railties (6.0.3.4) lib/rails/railtie.rb:190:in `public_send'
railties (6.0.3.4) lib/rails/railtie.rb:190:in `method_missing'
actionpack (6.0.3.4) lib/action_dispatch/routing/mapper.rb:19:in `block in <class:Constraints>'
actionpack (6.0.3.4) lib/action_dispatch/routing/mapper.rb:48:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:49:in `block in serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `each'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:834:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware/token_dispatcher.rb:20:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware/revocation_manager.rb:21:in `call'
rack (2.2.3) lib/rack/builder.rb:244:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware.rb:23:in `call'
warden (1.2.9) lib/warden/manager.rb:36:in `block in call'
warden (1.2.9) lib/warden/manager.rb:34:in `catch'
warden (1.2.9) lib/warden/manager.rb:34:in `call'
rack (2.2.3) lib/rack/tempfile_reaper.rb:15:in `call'
rack (2.2.3) lib/rack/etag.rb:27:in `call'
rack (2.2.3) lib/rack/conditional_get.rb:40:in `call'
rack (2.2.3) lib/rack/head.rb:12:in `call'
actionpack (6.0.3.4) lib/action_dispatch/http/content_security_policy.rb:18:in `call'
rack (2.2.3) lib/rack/session/abstract/id.rb:266:in `context'
rack (2.2.3) lib/rack/session/abstract/id.rb:260:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/cookies.rb:648:in `call'
activerecord (6.0.3.4) lib/active_record/migration.rb:567:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/callbacks.rb:27:in `block in call'
activesupport (6.0.3.4) lib/active_support/callbacks.rb:101:in `run_callbacks'
actionpack (6.0.3.4) lib/action_dispatch/middleware/callbacks.rb:26:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/executor.rb:14:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/debug_exceptions.rb:32:in `call'
web-console (4.1.0) lib/web_console/middleware.rb:132:in `call_app'
web-console (4.1.0) lib/web_console/middleware.rb:28:in `block in call'
web-console (4.1.0) lib/web_console/middleware.rb:17:in `catch'
web-console (4.1.0) lib/web_console/middleware.rb:17:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
railties (6.0.3.4) lib/rails/rack/logger.rb:37:in `call_app'
railties (6.0.3.4) lib/rails/rack/logger.rb:26:in `block in call'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:80:in `block in tagged'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:28:in `tagged'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:80:in `tagged'
railties (6.0.3.4) lib/rails/rack/logger.rb:26:in `call'
sprockets-rails (3.2.2) lib/sprockets/rails/quiet_assets.rb:13:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/remote_ip.rb:81:in `call'
request_store (1.5.0) lib/request_store/middleware.rb:19:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/request_id.rb:27:in `call'
rack (2.2.3) lib/rack/method_override.rb:24:in `call'
rack (2.2.3) lib/rack/runtime.rb:22:in `call'
activesupport (6.0.3.4) lib/active_support/cache/strategy/local_cache_middleware.rb:29:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/executor.rb:14:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/static.rb:126:in `call'
rack (2.2.3) lib/rack/sendfile.rb:110:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/host_authorization.rb:82:in `call'
webpacker (4.3.0) lib/webpacker/dev_server_proxy.rb:23:in `perform_request'
rack-proxy (0.6.5) lib/rack/proxy.rb:57:in `call'
railties (6.0.3.4) lib/rails/engine.rb:527:in `call'
puma (4.3.7) lib/puma/configuration.rb:228:in `call'
puma (4.3.7) lib/puma/server.rb:713:in `handle_request'
puma (4.3.7) lib/puma/server.rb:472:in `process_client'
puma (4.3.7) lib/puma/server.rb:328:in `block in run'
puma (4.3.7) lib/puma/thread_pool.rb:134:in `block in spawn_thread'
   (0.3ms)  BEGIN
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'
  Pay::Subscription Create (0.5ms)  INSERT INTO "pay_subscriptions" ("owner_type", "owner_id", "name", "processor", "processor_id", "processor_plan", "created_at", "updated_at", "status") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING "id"  [["owner_type", "BaseAccount"], ["owner_id", 4], ["name", "individual"], ["processor", "stripe"], ["processor_id", "sub_IpuZODxxJQeate"], ["processor_plan", "price_1I99wlIvmPrtU2SFRDGJ1ng3"], ["created_at", "2021-01-27 14:11:59.143738"], ["updated_at", "2021-01-27 14:11:59.143738"], ["status", "active"]]
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'
   (7.3ms)  COMMIT
  ↳ app/services/stripe_subscription.rb:10:in `create_monthly_subscription'
Redirected to http://localhost:3000/subscription
Completed 302 Found in 4802ms (ActiveRecord: 20.1ms | Allocations: 901934)


Started GET "/subscription" for 127.0.0.1 at 2021-01-27 22:11:59 +0800
Processing by SubscriptionsController#show as HTML
  User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 ORDER BY "users"."id" ASC LIMIT $2  [["id", 4], ["LIMIT", 1]]
  Rendering subscriptions/show.html.erb within layouts/application
  IndividualAccount Load (0.2ms)  SELECT "accounts".* FROM "accounts" WHERE "accounts"."type" = $1 AND "accounts"."user_id" = $2 LIMIT $3  [["type", "IndividualAccount"], ["user_id", 4], ["LIMIT", 1]]
  ↳ app/views/subscriptions/show.html.erb:3
  Pay::Subscription Load (0.1ms)  SELECT "pay_subscriptions".* FROM "pay_subscriptions" WHERE "pay_subscriptions"."owner_id" = $1 AND "pay_subscriptions"."owner_type" = $2 AND "pay_subscriptions"."name" = $3 ORDER BY "pay_subscriptions"."id" DESC LIMIT $4  [["owner_id", 4], ["owner_type", "BaseAccount"], ["name", "default"], ["LIMIT", 1]]
  ↳ app/views/subscriptions/show.html.erb:3
  Rendered subscriptions/show.html.erb within layouts/application (Duration: 2.4ms | Allocations: 1981)
[Webpacker] Everything's up-to-date. Nothing to do
Completed 200 OK in 7ms (Views: 4.6ms | ActiveRecord: 0.5ms | Allocations: 7178)


Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:11:59 +0800
Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkVIvmPrtU2SFgnUW9HAa", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "object"=>"charge", "amount"=>5000, "amount_captured"=>5000, "amount_refunded"=>0, "application"=>nil, "application_fee"=>nil, "application_fee_amount"=>nil, "balance_transaction"=>"txn_1IEEkUIvmPrtU2SF7MPH6CAl", "billing_details"=>{"address"=>{"city"=>nil, "country"=>nil, "line1"=>nil, "line2"=>nil, "postal_code"=>"42424", "state"=>nil}, "email"=>nil, "name"=>"Test User", "phone"=>nil}, "calculated_statement_descriptor"=>"TO PAY FOR A ROPE ACCE", "captured"=>true, "created"=>1611756717, "currency"=>"usd", "customer"=>"cus_IpuZZU5oNMB8bP", "description"=>"Subscription creation", "destination"=>nil, "dispute"=>nil, "disputed"=>false, "failure_code"=>nil, "failure_message"=>nil, "fraud_details"=>{}, "invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "livemode"=>false, "metadata"=>{}, "on_behalf_of"=>nil, "order"=>nil, "outcome"=>{"network_status"=>"approved_by_network", "reason"=>nil, "risk_level"=>"normal", "risk_score"=>26, "seller_message"=>"Payment complete.", "type"=>"authorized"}, "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "payment_method_details"=>{"card"=>{"brand"=>"visa", "checks"=>{"address_line1_check"=>nil, "address_postal_code_check"=>"pass", "cvc_check"=>"pass"}, "country"=>"US", "exp_month"=>4, "exp_year"=>2024, "fingerprint"=>"35xZD7Xp6NuDTryN", "funding"=>"credit", "installments"=>nil, "last4"=>"4242", "network"=>"visa", "three_d_secure"=>nil, "wallet"=>nil}, "type"=>"card"}, "receipt_email"=>nil, "receipt_number"=>nil, "receipt_url"=>"https://pay.stripe.com/receipts/acct_16sTorIvmPrtU2SF/ch_1IEEkTIvmPrtU2SFrHPvcM4g/rcpt_IpuZVkCDwrkJf6u8oYDv1TBjp2wTPha", "refunded"=>false, "refunds"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/charges/ch_1IEEkTIvmPrtU2SFrHPvcM4g/refunds"}, "review"=>nil, "shipping"=>nil, "source"=>nil, "source_transfer"=>nil, "statement_descriptor"=>nil, "statement_descriptor_suffix"=>nil, "status"=>"succeeded", "transfer_data"=>nil, "transfer_group"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"charge.succeeded", "webhook"=>{"id"=>"evt_1IEEkVIvmPrtU2SFgnUW9HAa", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "object"=>"charge", "amount"=>5000, "amount_captured"=>5000, "amount_refunded"=>0, "application"=>nil, "application_fee"=>nil, "application_fee_amount"=>nil, "balance_transaction"=>"txn_1IEEkUIvmPrtU2SF7MPH6CAl", "billing_details"=>{"address"=>{"city"=>nil, "country"=>nil, "line1"=>nil, "line2"=>nil, "postal_code"=>"42424", "state"=>nil}, "email"=>nil, "name"=>"Test User", "phone"=>nil}, "calculated_statement_descriptor"=>"TO PAY FOR A ROPE ACCE", "captured"=>true, "created"=>1611756717, "currency"=>"usd", "customer"=>"cus_IpuZZU5oNMB8bP", "description"=>"Subscription creation", "destination"=>nil, "dispute"=>nil, "disputed"=>false, "failure_code"=>nil, "failure_message"=>nil, "fraud_details"=>{}, "invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "livemode"=>false, "metadata"=>{}, "on_behalf_of"=>nil, "order"=>nil, "outcome"=>{"network_status"=>"approved_by_network", "reason"=>nil, "risk_level"=>"normal", "risk_score"=>26, "seller_message"=>"Payment complete.", "type"=>"authorized"}, "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "payment_method_details"=>{"card"=>{"brand"=>"visa", "checks"=>{"address_line1_check"=>nil, "address_postal_code_check"=>"pass", "cvc_check"=>"pass"}, "country"=>"US", "exp_month"=>4, "exp_year"=>2024, "fingerprint"=>"35xZD7Xp6NuDTryN", "funding"=>"credit", "installments"=>nil, "last4"=>"4242", "network"=>"visa", "three_d_secure"=>nil, "wallet"=>nil}, "type"=>"card"}, "receipt_email"=>nil, "receipt_number"=>nil, "receipt_url"=>"https://pay.stripe.com/receipts/acct_16sTorIvmPrtU2SF/ch_1IEEkTIvmPrtU2SFrHPvcM4g/rcpt_IpuZVkCDwrkJf6u8oYDv1TBjp2wTPha", "refunded"=>false, "refunds"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/charges/ch_1IEEkTIvmPrtU2SFrHPvcM4g/refunds"}, "review"=>nil, "shipping"=>nil, "source"=>nil, "source_transfer"=>nil, "statement_descriptor"=>nil, "statement_descriptor_suffix"=>nil, "status"=>"succeeded", "transfer_data"=>nil, "transfer_group"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"charge.succeeded"}}
  IndividualAccount Load (1.0ms)  SELECT "accounts".* FROM "accounts" WHERE "accounts"."type" = $1 AND "accounts"."processor" = $2 AND "accounts"."processor_id" = $3 LIMIT $4  [["type", "IndividualAccount"], ["processor", "stripe"], ["processor_id", "cus_IpuZZU5oNMB8bP"], ["LIMIT", 1]]
Completed 500 Internal Server Error in 16ms (ActiveRecord: 1.0ms | Allocations: 4680)


  
ActiveRecord::SubclassNotFound (Invalid single-table inheritance type: IndividualAccount is not a subclass of IndividualAccount):
  
activerecord (6.0.3.4) lib/active_record/inheritance.rb:241:in `find_sti_class'
activerecord (6.0.3.4) lib/active_record/inheritance.rb:215:in `discriminate_class_for_record'
activerecord (6.0.3.4) lib/active_record/persistence.rb:257:in `instantiate'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `block (2 levels) in find_by_sql'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `block in each'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `each'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `each'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `map'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `block in find_by_sql'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
activerecord (6.0.3.4) lib/active_record/querying.rb:56:in `find_by_sql'
activerecord (6.0.3.4) lib/active_record/relation.rb:821:in `block in exec_queries'
activerecord (6.0.3.4) lib/active_record/relation.rb:839:in `skip_query_cache_if_necessary'
activerecord (6.0.3.4) lib/active_record/relation.rb:808:in `exec_queries'
activerecord (6.0.3.4) lib/active_record/relation.rb:626:in `load'
activerecord (6.0.3.4) lib/active_record/relation.rb:250:in `records'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:499:in `find_take'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:98:in `take'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:81:in `find_by'
activerecord (6.0.3.4) lib/active_record/querying.rb:21:in `find_by'
activerecord (6.0.3.4) lib/active_record/core.rb:183:in `find_by'
pay (2.4.2) lib/pay.rb:69:in `block in find_billable'
pay (2.4.2) lib/pay.rb:68:in `each'
pay (2.4.2) lib/pay.rb:68:in `find_billable'
pay (2.4.2) lib/pay/stripe/webhooks/charge_succeeded.rb:7:in `call'
stripe_event (2.3.1) lib/stripe_event.rb:63:in `call'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:189:in `finish'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `block in finish'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `each'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `finish'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:45:in `finish_with_state'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:30:in `instrument'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `instrument'
stripe_event (2.3.1) lib/stripe_event.rb:18:in `instrument'
stripe_event (2.3.1) app/controllers/stripe_event/webhook_controller.rb:8:in `event'
actionpack (6.0.3.4) lib/action_controller/metal/basic_implicit_render.rb:6:in `send_action'
actionpack (6.0.3.4) lib/abstract_controller/base.rb:195:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/rendering.rb:30:in `process_action'
actionpack (6.0.3.4) lib/abstract_controller/callbacks.rb:42:in `block in process_action'
activesupport (6.0.3.4) lib/active_support/callbacks.rb:135:in `run_callbacks'
actionpack (6.0.3.4) lib/abstract_controller/callbacks.rb:41:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/rescue.rb:22:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/instrumentation.rb:33:in `block in process_action'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `block in instrument'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `instrument'
actionpack (6.0.3.4) lib/action_controller/metal/instrumentation.rb:32:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/params_wrapper.rb:245:in `process_action'
activerecord (6.0.3.4) lib/active_record/railties/controller_runtime.rb:27:in `process_action'
actionpack (6.0.3.4) lib/abstract_controller/base.rb:136:in `process'
actionview (6.0.3.4) lib/action_view/rendering.rb:39:in `process'
actionpack (6.0.3.4) lib/action_controller/metal.rb:190:in `dispatch'
actionpack (6.0.3.4) lib/action_controller/metal.rb:254:in `dispatch'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:50:in `dispatch'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:33:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:49:in `block in serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `each'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:834:in `call'
railties (6.0.3.4) lib/rails/engine.rb:527:in `call'
railties (6.0.3.4) lib/rails/railtie.rb:190:in `public_send'
railties (6.0.3.4) lib/rails/railtie.rb:190:in `method_missing'
actionpack (6.0.3.4) lib/action_dispatch/routing/mapper.rb:19:in `block in <class:Constraints>'
actionpack (6.0.3.4) lib/action_dispatch/routing/mapper.rb:48:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:49:in `block in serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `each'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:834:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware/token_dispatcher.rb:20:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware/revocation_manager.rb:21:in `call'
rack (2.2.3) lib/rack/builder.rb:244:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware.rb:23:in `call'
warden (1.2.9) lib/warden/manager.rb:36:in `block in call'
warden (1.2.9) lib/warden/manager.rb:34:in `catch'
warden (1.2.9) lib/warden/manager.rb:34:in `call'
rack (2.2.3) lib/rack/tempfile_reaper.rb:15:in `call'
rack (2.2.3) lib/rack/etag.rb:27:in `call'
rack (2.2.3) lib/rack/conditional_get.rb:40:in `call'
rack (2.2.3) lib/rack/head.rb:12:in `call'
actionpack (6.0.3.4) lib/action_dispatch/http/content_security_policy.rb:18:in `call'
rack (2.2.3) lib/rack/session/abstract/id.rb:266:in `context'
rack (2.2.3) lib/rack/session/abstract/id.rb:260:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/cookies.rb:648:in `call'
activerecord (6.0.3.4) lib/active_record/migration.rb:567:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/callbacks.rb:27:in `block in call'
activesupport (6.0.3.4) lib/active_support/callbacks.rb:101:in `run_callbacks'
actionpack (6.0.3.4) lib/action_dispatch/middleware/callbacks.rb:26:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/executor.rb:14:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/debug_exceptions.rb:32:in `call'
web-console (4.1.0) lib/web_console/middleware.rb:132:in `call_app'
web-console (4.1.0) lib/web_console/middleware.rb:28:in `block in call'
web-console (4.1.0) lib/web_console/middleware.rb:17:in `catch'
web-console (4.1.0) lib/web_console/middleware.rb:17:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
railties (6.0.3.4) lib/rails/rack/logger.rb:37:in `call_app'
railties (6.0.3.4) lib/rails/rack/logger.rb:26:in `block in call'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:80:in `block in tagged'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:28:in `tagged'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:80:in `tagged'
railties (6.0.3.4) lib/rails/rack/logger.rb:26:in `call'
sprockets-rails (3.2.2) lib/sprockets/rails/quiet_assets.rb:13:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/remote_ip.rb:81:in `call'
request_store (1.5.0) lib/request_store/middleware.rb:19:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/request_id.rb:27:in `call'
rack (2.2.3) lib/rack/method_override.rb:24:in `call'
rack (2.2.3) lib/rack/runtime.rb:22:in `call'
activesupport (6.0.3.4) lib/active_support/cache/strategy/local_cache_middleware.rb:29:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/executor.rb:14:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/static.rb:126:in `call'
rack (2.2.3) lib/rack/sendfile.rb:110:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/host_authorization.rb:82:in `call'
webpacker (4.3.0) lib/webpacker/dev_server_proxy.rb:23:in `perform_request'
rack-proxy (0.6.5) lib/rack/proxy.rb:57:in `call'
railties (6.0.3.4) lib/rails/engine.rb:527:in `call'
puma (4.3.7) lib/puma/configuration.rb:228:in `call'
puma (4.3.7) lib/puma/server.rb:713:in `handle_request'
puma (4.3.7) lib/puma/server.rb:472:in `process_client'
puma (4.3.7) lib/puma/server.rb:328:in `block in run'
puma (4.3.7) lib/puma/thread_pool.rb:134:in `block in spawn_thread'
Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:12:00 +0800
Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkVIvmPrtU2SFXr05wfXe", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"cus_IpuZZU5oNMB8bP", "object"=>"customer", "account_balance"=>0, "address"=>nil, "balance"=>0, "created"=>1611756714, "currency"=>"usd", "default_source"=>nil, "delinquent"=>false, "description"=>nil, "discount"=>nil, "email"=>"test@test.com", "invoice_prefix"=>"BE2459C1", "invoice_settings"=>{"custom_fields"=>nil, "default_payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "footer"=>nil}, "livemode"=>false, "metadata"=>{}, "name"=>nil, "next_invoice_sequence"=>2, "phone"=>nil, "preferred_locales"=>[], "shipping"=>nil, "sources"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/sources"}, "subscriptions"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"subscription", "application_fee_percent"=>nil, "billing"=>"charge_automatically", "billing_cycle_anchor"=>1611756716, "billing_thresholds"=>nil, "cancel_at"=>1614435116, "cancel_at_period_end"=>true, "canceled_at"=>1611756716, "collection_method"=>"charge_automatically", "created"=>1611756716, "current_period_end"=>1614435116, "current_period_start"=>1611756716, "customer"=>"cus_IpuZZU5oNMB8bP", "days_until_due"=>nil, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "discount"=>nil, "ended_at"=>nil, "invoice_customer_balance_settings"=>{"consume_applied_balance_on_void"=>true}, "items"=>{"object"=>"list", "data"=>[{"id"=>"si_IpuZbWOA9L62qz", "object"=>"subscription_item", "billing_thresholds"=>nil, "created"=>1611756717, "metadata"=>{}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "quantity"=>1, "subscription"=>"sub_IpuZODxxJQeate", "tax_rates"=>[]}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/subscription_items?subscription=sub_IpuZODxxJQeate"}, "latest_invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "livemode"=>false, "metadata"=>{}, "next_pending_invoice_item_invoice"=>nil, "pause_collection"=>nil, "pending_invoice_item_interval"=>nil, "pending_setup_intent"=>nil, "pending_update"=>nil, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "quantity"=>1, "schedule"=>nil, "start"=>1611756716, "start_date"=>1611756716, "status"=>"active", "tax_percent"=>nil, "transfer_data"=>nil, "trial_end"=>nil, "trial_start"=>nil}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/subscriptions"}, "tax_exempt"=>"none", "tax_ids"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/tax_ids"}, "tax_info"=>nil, "tax_info_verification"=>nil}, "previous_attributes"=>{"currency"=>nil}}, "livemode"=>false, "pending_webhooks"=>2, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"customer.updated", "webhook"=>{"id"=>"evt_1IEEkVIvmPrtU2SFXr05wfXe", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"cus_IpuZZU5oNMB8bP", "object"=>"customer", "account_balance"=>0, "address"=>nil, "balance"=>0, "created"=>1611756714, "currency"=>"usd", "default_source"=>nil, "delinquent"=>false, "description"=>nil, "discount"=>nil, "email"=>"test@test.com", "invoice_prefix"=>"BE2459C1", "invoice_settings"=>{"custom_fields"=>nil, "default_payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "footer"=>nil}, "livemode"=>false, "metadata"=>{}, "name"=>nil, "next_invoice_sequence"=>2, "phone"=>nil, "preferred_locales"=>[], "shipping"=>nil, "sources"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/sources"}, "subscriptions"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"subscription", "application_fee_percent"=>nil, "billing"=>"charge_automatically", "billing_cycle_anchor"=>1611756716, "billing_thresholds"=>nil, "cancel_at"=>1614435116, "cancel_at_period_end"=>true, "canceled_at"=>1611756716, "collection_method"=>"charge_automatically", "created"=>1611756716, "current_period_end"=>1614435116, "current_period_start"=>1611756716, "customer"=>"cus_IpuZZU5oNMB8bP", "days_until_due"=>nil, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "discount"=>nil, "ended_at"=>nil, "invoice_customer_balance_settings"=>{"consume_applied_balance_on_void"=>true}, "items"=>{"object"=>"list", "data"=>[{"id"=>"si_IpuZbWOA9L62qz", "object"=>"subscription_item", "billing_thresholds"=>nil, "created"=>1611756717, "metadata"=>{}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "quantity"=>1, "subscription"=>"sub_IpuZODxxJQeate", "tax_rates"=>[]}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/subscription_items?subscription=sub_IpuZODxxJQeate"}, "latest_invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "livemode"=>false, "metadata"=>{}, "next_pending_invoice_item_invoice"=>nil, "pause_collection"=>nil, "pending_invoice_item_interval"=>nil, "pending_setup_intent"=>nil, "pending_update"=>nil, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "quantity"=>1, "schedule"=>nil, "start"=>1611756716, "start_date"=>1611756716, "status"=>"active", "tax_percent"=>nil, "transfer_data"=>nil, "trial_end"=>nil, "trial_start"=>nil}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/subscriptions"}, "tax_exempt"=>"none", "tax_ids"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/customers/cus_IpuZZU5oNMB8bP/tax_ids"}, "tax_info"=>nil, "tax_info_verification"=>nil}, "previous_attributes"=>{"currency"=>nil}}, "livemode"=>false, "pending_webhooks"=>2, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"customer.updated"}}
  IndividualAccount Load (0.3ms)  SELECT "accounts".* FROM "accounts" WHERE "accounts"."type" = $1 AND "accounts"."processor" = $2 AND "accounts"."processor_id" = $3 LIMIT $4  [["type", "IndividualAccount"], ["processor", "stripe"], ["processor_id", "cus_IpuZZU5oNMB8bP"], ["LIMIT", 1]]
Completed 500 Internal Server Error in 4ms (ActiveRecord: 0.3ms | Allocations: 7230)


  
ActiveRecord::SubclassNotFound (Invalid single-table inheritance type: IndividualAccount is not a subclass of IndividualAccount):
  
activerecord (6.0.3.4) lib/active_record/inheritance.rb:241:in `find_sti_class'
activerecord (6.0.3.4) lib/active_record/inheritance.rb:215:in `discriminate_class_for_record'
activerecord (6.0.3.4) lib/active_record/persistence.rb:257:in `instantiate'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `block (2 levels) in find_by_sql'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `block in each'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `each'
activerecord (6.0.3.4) lib/active_record/result.rb:62:in `each'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `map'
activerecord (6.0.3.4) lib/active_record/querying.rb:58:in `block in find_by_sql'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
activerecord (6.0.3.4) lib/active_record/querying.rb:56:in `find_by_sql'
activerecord (6.0.3.4) lib/active_record/relation.rb:821:in `block in exec_queries'
activerecord (6.0.3.4) lib/active_record/relation.rb:839:in `skip_query_cache_if_necessary'
activerecord (6.0.3.4) lib/active_record/relation.rb:808:in `exec_queries'
activerecord (6.0.3.4) lib/active_record/relation.rb:626:in `load'
activerecord (6.0.3.4) lib/active_record/relation.rb:250:in `records'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:499:in `find_take'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:98:in `take'
activerecord (6.0.3.4) lib/active_record/relation/finder_methods.rb:81:in `find_by'
activerecord (6.0.3.4) lib/active_record/querying.rb:21:in `find_by'
activerecord (6.0.3.4) lib/active_record/core.rb:183:in `find_by'
pay (2.4.2) lib/pay.rb:69:in `block in find_billable'
pay (2.4.2) lib/pay.rb:68:in `each'
pay (2.4.2) lib/pay.rb:68:in `find_billable'
pay (2.4.2) lib/pay/stripe/webhooks/customer_updated.rb:7:in `call'
stripe_event (2.3.1) lib/stripe_event.rb:63:in `call'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:189:in `finish'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `block in finish'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `each'
activesupport (6.0.3.4) lib/active_support/notifications/fanout.rb:62:in `finish'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:45:in `finish_with_state'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:30:in `instrument'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `instrument'
stripe_event (2.3.1) lib/stripe_event.rb:18:in `instrument'
stripe_event (2.3.1) app/controllers/stripe_event/webhook_controller.rb:8:in `event'
actionpack (6.0.3.4) lib/action_controller/metal/basic_implicit_render.rb:6:in `send_action'
actionpack (6.0.3.4) lib/abstract_controller/base.rb:195:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/rendering.rb:30:in `process_action'
actionpack (6.0.3.4) lib/abstract_controller/callbacks.rb:42:in `block in process_action'
activesupport (6.0.3.4) lib/active_support/callbacks.rb:135:in `run_callbacks'
actionpack (6.0.3.4) lib/abstract_controller/callbacks.rb:41:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/rescue.rb:22:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/instrumentation.rb:33:in `block in process_action'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `block in instrument'
activesupport (6.0.3.4) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
activesupport (6.0.3.4) lib/active_support/notifications.rb:180:in `instrument'
actionpack (6.0.3.4) lib/action_controller/metal/instrumentation.rb:32:in `process_action'
actionpack (6.0.3.4) lib/action_controller/metal/params_wrapper.rb:245:in `process_action'
activerecord (6.0.3.4) lib/active_record/railties/controller_runtime.rb:27:in `process_action'
actionpack (6.0.3.4) lib/abstract_controller/base.rb:136:in `process'
actionview (6.0.3.4) lib/action_view/rendering.rb:39:in `process'
actionpack (6.0.3.4) lib/action_controller/metal.rb:190:in `dispatch'
actionpack (6.0.3.4) lib/action_controller/metal.rb:254:in `dispatch'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:50:in `dispatch'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:33:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:49:in `block in serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `each'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:834:in `call'
railties (6.0.3.4) lib/rails/engine.rb:527:in `call'
railties (6.0.3.4) lib/rails/railtie.rb:190:in `public_send'
railties (6.0.3.4) lib/rails/railtie.rb:190:in `method_missing'
actionpack (6.0.3.4) lib/action_dispatch/routing/mapper.rb:19:in `block in <class:Constraints>'
actionpack (6.0.3.4) lib/action_dispatch/routing/mapper.rb:48:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:49:in `block in serve'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `each'
actionpack (6.0.3.4) lib/action_dispatch/journey/router.rb:32:in `serve'
actionpack (6.0.3.4) lib/action_dispatch/routing/route_set.rb:834:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware/token_dispatcher.rb:20:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware/revocation_manager.rb:21:in `call'
rack (2.2.3) lib/rack/builder.rb:244:in `call'
warden-jwt_auth (0.5.0) lib/warden/jwt_auth/middleware.rb:23:in `call'
warden (1.2.9) lib/warden/manager.rb:36:in `block in call'
warden (1.2.9) lib/warden/manager.rb:34:in `catch'
warden (1.2.9) lib/warden/manager.rb:34:in `call'
rack (2.2.3) lib/rack/tempfile_reaper.rb:15:in `call'
rack (2.2.3) lib/rack/etag.rb:27:in `call'
rack (2.2.3) lib/rack/conditional_get.rb:40:in `call'
rack (2.2.3) lib/rack/head.rb:12:in `call'
actionpack (6.0.3.4) lib/action_dispatch/http/content_security_policy.rb:18:in `call'
rack (2.2.3) lib/rack/session/abstract/id.rb:266:in `context'
rack (2.2.3) lib/rack/session/abstract/id.rb:260:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/cookies.rb:648:in `call'
activerecord (6.0.3.4) lib/active_record/migration.rb:567:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/callbacks.rb:27:in `block in call'
activesupport (6.0.3.4) lib/active_support/callbacks.rb:101:in `run_callbacks'
actionpack (6.0.3.4) lib/action_dispatch/middleware/callbacks.rb:26:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/executor.rb:14:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/debug_exceptions.rb:32:in `call'
web-console (4.1.0) lib/web_console/middleware.rb:132:in `call_app'
web-console (4.1.0) lib/web_console/middleware.rb:28:in `block in call'
web-console (4.1.0) lib/web_console/middleware.rb:17:in `catch'
web-console (4.1.0) lib/web_console/middleware.rb:17:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
railties (6.0.3.4) lib/rails/rack/logger.rb:37:in `call_app'
railties (6.0.3.4) lib/rails/rack/logger.rb:26:in `block in call'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:80:in `block in tagged'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:28:in `tagged'
activesupport (6.0.3.4) lib/active_support/tagged_logging.rb:80:in `tagged'
railties (6.0.3.4) lib/rails/rack/logger.rb:26:in `call'
sprockets-rails (3.2.2) lib/sprockets/rails/quiet_assets.rb:13:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/remote_ip.rb:81:in `call'
request_store (1.5.0) lib/request_store/middleware.rb:19:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/request_id.rb:27:in `call'
rack (2.2.3) lib/rack/method_override.rb:24:in `call'
rack (2.2.3) lib/rack/runtime.rb:22:in `call'
activesupport (6.0.3.4) lib/active_support/cache/strategy/local_cache_middleware.rb:29:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/executor.rb:14:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/static.rb:126:in `call'
rack (2.2.3) lib/rack/sendfile.rb:110:in `call'
actionpack (6.0.3.4) lib/action_dispatch/middleware/host_authorization.rb:82:in `call'
webpacker (4.3.0) lib/webpacker/dev_server_proxy.rb:23:in `perform_request'
rack-proxy (0.6.5) lib/rack/proxy.rb:57:in `call'
railties (6.0.3.4) lib/rails/engine.rb:527:in `call'
puma (4.3.7) lib/puma/configuration.rb:228:in `call'
puma (4.3.7) lib/puma/server.rb:713:in `handle_request'
puma (4.3.7) lib/puma/server.rb:472:in `process_client'
puma (4.3.7) lib/puma/server.rb:328:in `block in run'
puma (4.3.7) lib/puma/thread_pool.rb:134:in `block in spawn_thread'
Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:12:00 +0800
Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:12:00 +0800
Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:12:00 +0800
Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkVIvmPrtU2SFVdAA91eu", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "object"=>"invoice", "account_country"=>"GB", "account_name"=>"Education funding", "account_tax_ids"=>nil, "amount_due"=>5000, "amount_paid"=>5000, "amount_remaining"=>0, "application_fee"=>nil, "attempt_count"=>1, "attempted"=>true, "auto_advance"=>false, "billing"=>"charge_automatically", "billing_reason"=>"subscription_update", "charge"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "closed"=>true, "collection_method"=>"charge_automatically", "created"=>1611756717, "currency"=>"usd", "custom_fields"=>nil, "customer"=>"cus_IpuZZU5oNMB8bP", "customer_address"=>nil, "customer_email"=>"test@test.com", "customer_name"=>nil, "customer_phone"=>nil, "customer_shipping"=>nil, "customer_tax_exempt"=>"none", "customer_tax_ids"=>[], "date"=>1611756717, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "description"=>nil, "discount"=>nil, "discounts"=>[], "due_date"=>nil, "ending_balance"=>0, "finalized_at"=>1611756716, "footer"=>nil, "forgiven"=>false, "hosted_invoice_url"=>"https://invoice.stripe.com/i/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1", "invoice_pdf"=>"https://pay.stripe.com/invoice/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1/pdf", "last_finalization_error"=>nil, "lines"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"line_item", "amount"=>5000, "currency"=>"usd", "description"=>nil, "discount_amounts"=>[], "discountable"=>true, "discounts"=>[], "livemode"=>false, "metadata"=>{}, "period"=>{"end"=>1614435116, "start"=>1611756716}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "proration"=>false, "quantity"=>1, "subscription"=>nil, "subscription_item"=>"si_IpuZbWOA9L62qz", "tax_amounts"=>[], "tax_rates"=>[], "type"=>"subscription", "unique_id"=>"il_1IEEkTIvmPrtU2SFyqQX0DQW", "unique_line_item_id"=>"sli_346fa79984e9a3"}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/invoices/in_1IEEkTIvmPrtU2SFGooUYnJ8/lines"}, "livemode"=>false, "metadata"=>{}, "next_payment_attempt"=>nil, "number"=>"BE2459C1-0001", "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "period_end"=>1611756716, "period_start"=>1611756716, "post_payment_credit_notes_amount"=>0, "pre_payment_credit_notes_amount"=>0, "receipt_number"=>nil, "starting_balance"=>0, "statement_descriptor"=>nil, "status"=>"paid", "status_transitions"=>{"finalized_at"=>1611756716, "marked_uncollectible_at"=>nil, "paid_at"=>1611756716, "voided_at"=>nil}, "subscription"=>"sub_IpuZODxxJQeate", "subtotal"=>5000, "tax"=>nil, "tax_percent"=>nil, "total"=>5000, "total_discount_amounts"=>[], "total_tax_amounts"=>[], "transfer_data"=>nil, "webhooks_delivered_at"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"invoice.created", "webhook"=>{"id"=>"evt_1IEEkVIvmPrtU2SFVdAA91eu", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "object"=>"invoice", "account_country"=>"GB", "account_name"=>"Education funding", "account_tax_ids"=>nil, "amount_due"=>5000, "amount_paid"=>5000, "amount_remaining"=>0, "application_fee"=>nil, "attempt_count"=>1, "attempted"=>true, "auto_advance"=>false, "billing"=>"charge_automatically", "billing_reason"=>"subscription_update", "charge"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "closed"=>true, "collection_method"=>"charge_automatically", "created"=>1611756717, "currency"=>"usd", "custom_fields"=>nil, "customer"=>"cus_IpuZZU5oNMB8bP", "customer_address"=>nil, "customer_email"=>"test@test.com", "customer_name"=>nil, "customer_phone"=>nil, "customer_shipping"=>nil, "customer_tax_exempt"=>"none", "customer_tax_ids"=>[], "date"=>1611756717, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "description"=>nil, "discount"=>nil, "discounts"=>[], "due_date"=>nil, "ending_balance"=>0, "finalized_at"=>1611756716, "footer"=>nil, "forgiven"=>false, "hosted_invoice_url"=>"https://invoice.stripe.com/i/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1", "invoice_pdf"=>"https://pay.stripe.com/invoice/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1/pdf", "last_finalization_error"=>nil, "lines"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"line_item", "amount"=>5000, "currency"=>"usd", "description"=>nil, "discount_amounts"=>[], "discountable"=>true, "discounts"=>[], "livemode"=>false, "metadata"=>{}, "period"=>{"end"=>1614435116, "start"=>1611756716}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "proration"=>false, "quantity"=>1, "subscription"=>nil, "subscription_item"=>"si_IpuZbWOA9L62qz", "tax_amounts"=>[], "tax_rates"=>[], "type"=>"subscription", "unique_id"=>"il_1IEEkTIvmPrtU2SFyqQX0DQW", "unique_line_item_id"=>"sli_346fa79984e9a3"}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/invoices/in_1IEEkTIvmPrtU2SFGooUYnJ8/lines"}, "livemode"=>false, "metadata"=>{}, "next_payment_attempt"=>nil, "number"=>"BE2459C1-0001", "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "period_end"=>1611756716, "period_start"=>1611756716, "post_payment_credit_notes_amount"=>0, "pre_payment_credit_notes_amount"=>0, "receipt_number"=>nil, "starting_balance"=>0, "statement_descriptor"=>nil, "status"=>"paid", "status_transitions"=>{"finalized_at"=>1611756716, "marked_uncollectible_at"=>nil, "paid_at"=>1611756716, "voided_at"=>nil}, "subscription"=>"sub_IpuZODxxJQeate", "subtotal"=>5000, "tax"=>nil, "tax_percent"=>nil, "total"=>5000, "total_discount_amounts"=>[], "total_tax_amounts"=>[], "transfer_data"=>nil, "webhooks_delivered_at"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"invoice.created"}}
Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:12:00 +0800
Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:12:00 +0800
Completed 200 OK in 2ms (ActiveRecord: 0.0ms | Allocations: 3889)


Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkVIvmPrtU2SFlYS2sy5P", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "object"=>"invoice", "account_country"=>"GB", "account_name"=>"Education funding", "account_tax_ids"=>nil, "amount_due"=>5000, "amount_paid"=>5000, "amount_remaining"=>0, "application_fee"=>nil, "attempt_count"=>1, "attempted"=>true, "auto_advance"=>false, "billing"=>"charge_automatically", "billing_reason"=>"subscription_update", "charge"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "closed"=>true, "collection_method"=>"charge_automatically", "created"=>1611756717, "currency"=>"usd", "custom_fields"=>nil, "customer"=>"cus_IpuZZU5oNMB8bP", "customer_address"=>nil, "customer_email"=>"test@test.com", "customer_name"=>nil, "customer_phone"=>nil, "customer_shipping"=>nil, "customer_tax_exempt"=>"none", "customer_tax_ids"=>[], "date"=>1611756717, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "description"=>nil, "discount"=>nil, "discounts"=>[], "due_date"=>nil, "ending_balance"=>0, "finalized_at"=>1611756716, "footer"=>nil, "forgiven"=>false, "hosted_invoice_url"=>"https://invoice.stripe.com/i/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1", "invoice_pdf"=>"https://pay.stripe.com/invoice/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1/pdf", "last_finalization_error"=>nil, "lines"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"line_item", "amount"=>5000, "currency"=>"usd", "description"=>nil, "discount_amounts"=>[], "discountable"=>true, "discounts"=>[], "livemode"=>false, "metadata"=>{}, "period"=>{"end"=>1614435116, "start"=>1611756716}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "proration"=>false, "quantity"=>1, "subscription"=>nil, "subscription_item"=>"si_IpuZbWOA9L62qz", "tax_amounts"=>[], "tax_rates"=>[], "type"=>"subscription", "unique_id"=>"il_1IEEkTIvmPrtU2SFyqQX0DQW", "unique_line_item_id"=>"sli_346fa79984e9a3"}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/invoices/in_1IEEkTIvmPrtU2SFGooUYnJ8/lines"}, "livemode"=>false, "metadata"=>{}, "next_payment_attempt"=>nil, "number"=>"BE2459C1-0001", "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "period_end"=>1611756716, "period_start"=>1611756716, "post_payment_credit_notes_amount"=>0, "pre_payment_credit_notes_amount"=>0, "receipt_number"=>nil, "starting_balance"=>0, "statement_descriptor"=>nil, "status"=>"paid", "status_transitions"=>{"finalized_at"=>1611756716, "marked_uncollectible_at"=>nil, "paid_at"=>1611756716, "voided_at"=>nil}, "subscription"=>"sub_IpuZODxxJQeate", "subtotal"=>5000, "tax"=>nil, "tax_percent"=>nil, "total"=>5000, "total_discount_amounts"=>[], "total_tax_amounts"=>[], "transfer_data"=>nil, "webhooks_delivered_at"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"invoice.finalized", "webhook"=>{"id"=>"evt_1IEEkVIvmPrtU2SFlYS2sy5P", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "object"=>"invoice", "account_country"=>"GB", "account_name"=>"Education funding", "account_tax_ids"=>nil, "amount_due"=>5000, "amount_paid"=>5000, "amount_remaining"=>0, "application_fee"=>nil, "attempt_count"=>1, "attempted"=>true, "auto_advance"=>false, "billing"=>"charge_automatically", "billing_reason"=>"subscription_update", "charge"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "closed"=>true, "collection_method"=>"charge_automatically", "created"=>1611756717, "currency"=>"usd", "custom_fields"=>nil, "customer"=>"cus_IpuZZU5oNMB8bP", "customer_address"=>nil, "customer_email"=>"test@test.com", "customer_name"=>nil, "customer_phone"=>nil, "customer_shipping"=>nil, "customer_tax_exempt"=>"none", "customer_tax_ids"=>[], "date"=>1611756717, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "description"=>nil, "discount"=>nil, "discounts"=>[], "due_date"=>nil, "ending_balance"=>0, "finalized_at"=>1611756716, "footer"=>nil, "forgiven"=>false, "hosted_invoice_url"=>"https://invoice.stripe.com/i/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1", "invoice_pdf"=>"https://pay.stripe.com/invoice/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1/pdf", "last_finalization_error"=>nil, "lines"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"line_item", "amount"=>5000, "currency"=>"usd", "description"=>nil, "discount_amounts"=>[], "discountable"=>true, "discounts"=>[], "livemode"=>false, "metadata"=>{}, "period"=>{"end"=>1614435116, "start"=>1611756716}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "proration"=>false, "quantity"=>1, "subscription"=>nil, "subscription_item"=>"si_IpuZbWOA9L62qz", "tax_amounts"=>[], "tax_rates"=>[], "type"=>"subscription", "unique_id"=>"il_1IEEkTIvmPrtU2SFyqQX0DQW", "unique_line_item_id"=>"sli_346fa79984e9a3"}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/invoices/in_1IEEkTIvmPrtU2SFGooUYnJ8/lines"}, "livemode"=>false, "metadata"=>{}, "next_payment_attempt"=>nil, "number"=>"BE2459C1-0001", "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "period_end"=>1611756716, "period_start"=>1611756716, "post_payment_credit_notes_amount"=>0, "pre_payment_credit_notes_amount"=>0, "receipt_number"=>nil, "starting_balance"=>0, "statement_descriptor"=>nil, "status"=>"paid", "status_transitions"=>{"finalized_at"=>1611756716, "marked_uncollectible_at"=>nil, "paid_at"=>1611756716, "voided_at"=>nil}, "subscription"=>"sub_IpuZODxxJQeate", "subtotal"=>5000, "tax"=>nil, "tax_percent"=>nil, "total"=>5000, "total_discount_amounts"=>[], "total_tax_amounts"=>[], "transfer_data"=>nil, "webhooks_delivered_at"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"invoice.finalized"}}
Completed 200 OK in 2ms (ActiveRecord: 0.0ms | Allocations: 3889)


Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkVIvmPrtU2SFYGSQwaIl", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "object"=>"invoice", "account_country"=>"GB", "account_name"=>"Education funding", "account_tax_ids"=>nil, "amount_due"=>5000, "amount_paid"=>5000, "amount_remaining"=>0, "application_fee"=>nil, "attempt_count"=>1, "attempted"=>true, "auto_advance"=>false, "billing"=>"charge_automatically", "billing_reason"=>"subscription_update", "charge"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "closed"=>true, "collection_method"=>"charge_automatically", "created"=>1611756717, "currency"=>"usd", "custom_fields"=>nil, "customer"=>"cus_IpuZZU5oNMB8bP", "customer_address"=>nil, "customer_email"=>"test@test.com", "customer_name"=>nil, "customer_phone"=>nil, "customer_shipping"=>nil, "customer_tax_exempt"=>"none", "customer_tax_ids"=>[], "date"=>1611756717, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "description"=>nil, "discount"=>nil, "discounts"=>[], "due_date"=>nil, "ending_balance"=>0, "finalized_at"=>1611756716, "footer"=>nil, "forgiven"=>false, "hosted_invoice_url"=>"https://invoice.stripe.com/i/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1", "invoice_pdf"=>"https://pay.stripe.com/invoice/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1/pdf", "last_finalization_error"=>nil, "lines"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"line_item", "amount"=>5000, "currency"=>"usd", "description"=>nil, "discount_amounts"=>[], "discountable"=>true, "discounts"=>[], "livemode"=>false, "metadata"=>{}, "period"=>{"end"=>1614435116, "start"=>1611756716}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "proration"=>false, "quantity"=>1, "subscription"=>nil, "subscription_item"=>"si_IpuZbWOA9L62qz", "tax_amounts"=>[], "tax_rates"=>[], "type"=>"subscription", "unique_id"=>"il_1IEEkTIvmPrtU2SFyqQX0DQW", "unique_line_item_id"=>"sli_346fa79984e9a3"}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/invoices/in_1IEEkTIvmPrtU2SFGooUYnJ8/lines"}, "livemode"=>false, "metadata"=>{}, "next_payment_attempt"=>nil, "number"=>"BE2459C1-0001", "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "period_end"=>1611756716, "period_start"=>1611756716, "post_payment_credit_notes_amount"=>0, "pre_payment_credit_notes_amount"=>0, "receipt_number"=>nil, "starting_balance"=>0, "statement_descriptor"=>nil, "status"=>"paid", "status_transitions"=>{"finalized_at"=>1611756716, "marked_uncollectible_at"=>nil, "paid_at"=>1611756716, "voided_at"=>nil}, "subscription"=>"sub_IpuZODxxJQeate", "subtotal"=>5000, "tax"=>nil, "tax_percent"=>nil, "total"=>5000, "total_discount_amounts"=>[], "total_tax_amounts"=>[], "transfer_data"=>nil, "webhooks_delivered_at"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"invoice.paid", "webhook"=>{"id"=>"evt_1IEEkVIvmPrtU2SFYGSQwaIl", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "object"=>"invoice", "account_country"=>"GB", "account_name"=>"Education funding", "account_tax_ids"=>nil, "amount_due"=>5000, "amount_paid"=>5000, "amount_remaining"=>0, "application_fee"=>nil, "attempt_count"=>1, "attempted"=>true, "auto_advance"=>false, "billing"=>"charge_automatically", "billing_reason"=>"subscription_update", "charge"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "closed"=>true, "collection_method"=>"charge_automatically", "created"=>1611756717, "currency"=>"usd", "custom_fields"=>nil, "customer"=>"cus_IpuZZU5oNMB8bP", "customer_address"=>nil, "customer_email"=>"test@test.com", "customer_name"=>nil, "customer_phone"=>nil, "customer_shipping"=>nil, "customer_tax_exempt"=>"none", "customer_tax_ids"=>[], "date"=>1611756717, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "description"=>nil, "discount"=>nil, "discounts"=>[], "due_date"=>nil, "ending_balance"=>0, "finalized_at"=>1611756716, "footer"=>nil, "forgiven"=>false, "hosted_invoice_url"=>"https://invoice.stripe.com/i/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1", "invoice_pdf"=>"https://pay.stripe.com/invoice/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1/pdf", "last_finalization_error"=>nil, "lines"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"line_item", "amount"=>5000, "currency"=>"usd", "description"=>nil, "discount_amounts"=>[], "discountable"=>true, "discounts"=>[], "livemode"=>false, "metadata"=>{}, "period"=>{"end"=>1614435116, "start"=>1611756716}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "proration"=>false, "quantity"=>1, "subscription"=>nil, "subscription_item"=>"si_IpuZbWOA9L62qz", "tax_amounts"=>[], "tax_rates"=>[], "type"=>"subscription", "unique_id"=>"il_1IEEkTIvmPrtU2SFyqQX0DQW", "unique_line_item_id"=>"sli_346fa79984e9a3"}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/invoices/in_1IEEkTIvmPrtU2SFGooUYnJ8/lines"}, "livemode"=>false, "metadata"=>{}, "next_payment_attempt"=>nil, "number"=>"BE2459C1-0001", "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "period_end"=>1611756716, "period_start"=>1611756716, "post_payment_credit_notes_amount"=>0, "pre_payment_credit_notes_amount"=>0, "receipt_number"=>nil, "starting_balance"=>0, "statement_descriptor"=>nil, "status"=>"paid", "status_transitions"=>{"finalized_at"=>1611756716, "marked_uncollectible_at"=>nil, "paid_at"=>1611756716, "voided_at"=>nil}, "subscription"=>"sub_IpuZODxxJQeate", "subtotal"=>5000, "tax"=>nil, "tax_percent"=>nil, "total"=>5000, "total_discount_amounts"=>[], "total_tax_amounts"=>[], "transfer_data"=>nil, "webhooks_delivered_at"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"invoice.paid"}}
Completed 200 OK in 2ms (ActiveRecord: 0.0ms | Allocations: 3889)


Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkVIvmPrtU2SFIiQzBtoX", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "object"=>"invoice", "account_country"=>"GB", "account_name"=>"Education funding", "account_tax_ids"=>nil, "amount_due"=>5000, "amount_paid"=>5000, "amount_remaining"=>0, "application_fee"=>nil, "attempt_count"=>1, "attempted"=>true, "auto_advance"=>false, "billing"=>"charge_automatically", "billing_reason"=>"subscription_update", "charge"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "closed"=>true, "collection_method"=>"charge_automatically", "created"=>1611756717, "currency"=>"usd", "custom_fields"=>nil, "customer"=>"cus_IpuZZU5oNMB8bP", "customer_address"=>nil, "customer_email"=>"test@test.com", "customer_name"=>nil, "customer_phone"=>nil, "customer_shipping"=>nil, "customer_tax_exempt"=>"none", "customer_tax_ids"=>[], "date"=>1611756717, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "description"=>nil, "discount"=>nil, "discounts"=>[], "due_date"=>nil, "ending_balance"=>0, "finalized_at"=>1611756716, "footer"=>nil, "forgiven"=>false, "hosted_invoice_url"=>"https://invoice.stripe.com/i/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1", "invoice_pdf"=>"https://pay.stripe.com/invoice/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1/pdf", "last_finalization_error"=>nil, "lines"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"line_item", "amount"=>5000, "currency"=>"usd", "description"=>nil, "discount_amounts"=>[], "discountable"=>true, "discounts"=>[], "livemode"=>false, "metadata"=>{}, "period"=>{"end"=>1614435116, "start"=>1611756716}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "proration"=>false, "quantity"=>1, "subscription"=>nil, "subscription_item"=>"si_IpuZbWOA9L62qz", "tax_amounts"=>[], "tax_rates"=>[], "type"=>"subscription", "unique_id"=>"il_1IEEkTIvmPrtU2SFyqQX0DQW", "unique_line_item_id"=>"sli_346fa79984e9a3"}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/invoices/in_1IEEkTIvmPrtU2SFGooUYnJ8/lines"}, "livemode"=>false, "metadata"=>{}, "next_payment_attempt"=>nil, "number"=>"BE2459C1-0001", "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "period_end"=>1611756716, "period_start"=>1611756716, "post_payment_credit_notes_amount"=>0, "pre_payment_credit_notes_amount"=>0, "receipt_number"=>nil, "starting_balance"=>0, "statement_descriptor"=>nil, "status"=>"paid", "status_transitions"=>{"finalized_at"=>1611756716, "marked_uncollectible_at"=>nil, "paid_at"=>1611756716, "voided_at"=>nil}, "subscription"=>"sub_IpuZODxxJQeate", "subtotal"=>5000, "tax"=>nil, "tax_percent"=>nil, "total"=>5000, "total_discount_amounts"=>[], "total_tax_amounts"=>[], "transfer_data"=>nil, "webhooks_delivered_at"=>nil}}, "livemode"=>false, "pending_webhooks"=>2, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"invoice.payment_succeeded", "webhook"=>{"id"=>"evt_1IEEkVIvmPrtU2SFIiQzBtoX", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "object"=>"invoice", "account_country"=>"GB", "account_name"=>"Education funding", "account_tax_ids"=>nil, "amount_due"=>5000, "amount_paid"=>5000, "amount_remaining"=>0, "application_fee"=>nil, "attempt_count"=>1, "attempted"=>true, "auto_advance"=>false, "billing"=>"charge_automatically", "billing_reason"=>"subscription_update", "charge"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "closed"=>true, "collection_method"=>"charge_automatically", "created"=>1611756717, "currency"=>"usd", "custom_fields"=>nil, "customer"=>"cus_IpuZZU5oNMB8bP", "customer_address"=>nil, "customer_email"=>"test@test.com", "customer_name"=>nil, "customer_phone"=>nil, "customer_shipping"=>nil, "customer_tax_exempt"=>"none", "customer_tax_ids"=>[], "date"=>1611756717, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "description"=>nil, "discount"=>nil, "discounts"=>[], "due_date"=>nil, "ending_balance"=>0, "finalized_at"=>1611756716, "footer"=>nil, "forgiven"=>false, "hosted_invoice_url"=>"https://invoice.stripe.com/i/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1", "invoice_pdf"=>"https://pay.stripe.com/invoice/acct_16sTorIvmPrtU2SF/invst_IpuZtx9DBlzoHsJ8lYxg2BhfozT0Vs1/pdf", "last_finalization_error"=>nil, "lines"=>{"object"=>"list", "data"=>[{"id"=>"sub_IpuZODxxJQeate", "object"=>"line_item", "amount"=>5000, "currency"=>"usd", "description"=>nil, "discount_amounts"=>[], "discountable"=>true, "discounts"=>[], "livemode"=>false, "metadata"=>{}, "period"=>{"end"=>1614435116, "start"=>1611756716}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "proration"=>false, "quantity"=>1, "subscription"=>nil, "subscription_item"=>"si_IpuZbWOA9L62qz", "tax_amounts"=>[], "tax_rates"=>[], "type"=>"subscription", "unique_id"=>"il_1IEEkTIvmPrtU2SFyqQX0DQW", "unique_line_item_id"=>"sli_346fa79984e9a3"}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/invoices/in_1IEEkTIvmPrtU2SFGooUYnJ8/lines"}, "livemode"=>false, "metadata"=>{}, "next_payment_attempt"=>nil, "number"=>"BE2459C1-0001", "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "period_end"=>1611756716, "period_start"=>1611756716, "post_payment_credit_notes_amount"=>0, "pre_payment_credit_notes_amount"=>0, "receipt_number"=>nil, "starting_balance"=>0, "statement_descriptor"=>nil, "status"=>"paid", "status_transitions"=>{"finalized_at"=>1611756716, "marked_uncollectible_at"=>nil, "paid_at"=>1611756716, "voided_at"=>nil}, "subscription"=>"sub_IpuZODxxJQeate", "subtotal"=>5000, "tax"=>nil, "tax_percent"=>nil, "total"=>5000, "total_discount_amounts"=>[], "total_tax_amounts"=>[], "transfer_data"=>nil, "webhooks_delivered_at"=>nil}}, "livemode"=>false, "pending_webhooks"=>2, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"invoice.payment_succeeded"}}
Processing by StripeEvent::WebhookController#event as XML
Completed 200 OK in 2ms (ActiveRecord: 0.0ms | Allocations: 3889)


  Parameters: {"id"=>"evt_1IEEkWIvmPrtU2SFR9Qqu4ig", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"sub_IpuZODxxJQeate", "object"=>"subscription", "application_fee_percent"=>nil, "billing"=>"charge_automatically", "billing_cycle_anchor"=>1611756716, "billing_thresholds"=>nil, "cancel_at"=>1614435116, "cancel_at_period_end"=>true, "canceled_at"=>1611756716, "collection_method"=>"charge_automatically", "created"=>1611756716, "current_period_end"=>1614435116, "current_period_start"=>1611756716, "customer"=>"cus_IpuZZU5oNMB8bP", "days_until_due"=>nil, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "discount"=>nil, "ended_at"=>nil, "invoice_customer_balance_settings"=>{"consume_applied_balance_on_void"=>true}, "items"=>{"object"=>"list", "data"=>[{"id"=>"si_IpuZbWOA9L62qz", "object"=>"subscription_item", "billing_thresholds"=>nil, "created"=>1611756717, "metadata"=>{}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "quantity"=>1, "subscription"=>"sub_IpuZODxxJQeate", "tax_rates"=>[]}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/subscription_items?subscription=sub_IpuZODxxJQeate"}, "latest_invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "livemode"=>false, "metadata"=>{}, "next_pending_invoice_item_invoice"=>nil, "pause_collection"=>nil, "pending_invoice_item_interval"=>nil, "pending_setup_intent"=>nil, "pending_update"=>nil, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "quantity"=>1, "schedule"=>nil, "start"=>1611756716, "start_date"=>1611756716, "status"=>"active", "tax_percent"=>nil, "transfer_data"=>nil, "trial_end"=>nil, "trial_start"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"customer.subscription.created", "webhook"=>{"id"=>"evt_1IEEkWIvmPrtU2SFR9Qqu4ig", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"sub_IpuZODxxJQeate", "object"=>"subscription", "application_fee_percent"=>nil, "billing"=>"charge_automatically", "billing_cycle_anchor"=>1611756716, "billing_thresholds"=>nil, "cancel_at"=>1614435116, "cancel_at_period_end"=>true, "canceled_at"=>1611756716, "collection_method"=>"charge_automatically", "created"=>1611756716, "current_period_end"=>1614435116, "current_period_start"=>1611756716, "customer"=>"cus_IpuZZU5oNMB8bP", "days_until_due"=>nil, "default_payment_method"=>nil, "default_source"=>nil, "default_tax_rates"=>[], "discount"=>nil, "ended_at"=>nil, "invoice_customer_balance_settings"=>{"consume_applied_balance_on_void"=>true}, "items"=>{"object"=>"list", "data"=>[{"id"=>"si_IpuZbWOA9L62qz", "object"=>"subscription_item", "billing_thresholds"=>nil, "created"=>1611756717, "metadata"=>{}, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "price"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"price", "active"=>true, "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "livemode"=>false, "lookup_key"=>nil, "metadata"=>{}, "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "recurring"=>{"aggregate_usage"=>nil, "interval"=>"month", "interval_count"=>1, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "tiers_mode"=>nil, "transform_quantity"=>nil, "type"=>"recurring", "unit_amount"=>5000, "unit_amount_decimal"=>"5000"}, "quantity"=>1, "subscription"=>"sub_IpuZODxxJQeate", "tax_rates"=>[]}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/subscription_items?subscription=sub_IpuZODxxJQeate"}, "latest_invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "livemode"=>false, "metadata"=>{}, "next_pending_invoice_item_invoice"=>nil, "pause_collection"=>nil, "pending_invoice_item_interval"=>nil, "pending_setup_intent"=>nil, "pending_update"=>nil, "plan"=>{"id"=>"price_1I99wlIvmPrtU2SFRDGJ1ng3", "object"=>"plan", "active"=>true, "aggregate_usage"=>nil, "amount"=>5000, "amount_decimal"=>"5000", "billing_scheme"=>"per_unit", "created"=>1610546619, "currency"=>"usd", "interval"=>"month", "interval_count"=>1, "livemode"=>false, "metadata"=>{}, "name"=>"Premium plan", "nickname"=>nil, "product"=>"prod_IkfHXgCySrIaL9", "statement_descriptor"=>nil, "tiers"=>nil, "tiers_mode"=>nil, "transform_usage"=>nil, "trial_period_days"=>nil, "usage_type"=>"licensed"}, "quantity"=>1, "schedule"=>nil, "start"=>1611756716, "start_date"=>1611756716, "status"=>"active", "tax_percent"=>nil, "transfer_data"=>nil, "trial_end"=>nil, "trial_start"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"customer.subscription.created"}}
  Pay::Subscription Load (0.2ms)  SELECT "pay_subscriptions".* FROM "pay_subscriptions" WHERE "pay_subscriptions"."processor" = $1 AND "pay_subscriptions"."processor_id" = $2 LIMIT $3  [["processor", "stripe"], ["processor_id", "sub_IpuZODxxJQeate"], ["LIMIT", 1]]
   (0.1ms)  BEGIN
  BaseAccount Load (0.2ms)  SELECT "accounts".* FROM "accounts" WHERE "accounts"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]
  Pay::Subscription Update (0.2ms)  UPDATE "pay_subscriptions" SET "ends_at" = $1, "updated_at" = $2 WHERE "pay_subscriptions"."id" = $3  [["ends_at", "2021-02-27 14:11:56"], ["updated_at", "2021-01-27 14:12:00.801143"], ["id", 4]]
   (7.2ms)  COMMIT
Completed 200 OK in 15ms (ActiveRecord: 7.9ms | Allocations: 12198)


Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:12:01 +0800
Started POST "/pay/webhooks/stripe" for 127.0.0.1 at 2021-01-27 22:12:01 +0800
Processing by StripeEvent::WebhookController#event as XML
  Parameters: {"id"=>"evt_1IEEkWIvmPrtU2SFPBDohnPE", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "object"=>"payment_intent", "allowed_source_types"=>["card"], "amount"=>5000, "amount_capturable"=>0, "amount_received"=>5000, "application"=>nil, "application_fee_amount"=>nil, "canceled_at"=>nil, "cancellation_reason"=>nil, "capture_method"=>"automatic", "charges"=>{"object"=>"list", "data"=>[{"id"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "object"=>"charge", "amount"=>5000, "amount_captured"=>5000, "amount_refunded"=>0, "application"=>nil, "application_fee"=>nil, "application_fee_amount"=>nil, "balance_transaction"=>"txn_1IEEkUIvmPrtU2SF7MPH6CAl", "billing_details"=>{"address"=>{"city"=>nil, "country"=>nil, "line1"=>nil, "line2"=>nil, "postal_code"=>"42424", "state"=>nil}, "email"=>nil, "name"=>"Test User", "phone"=>nil}, "calculated_statement_descriptor"=>"TO PAY FOR A ROPE ACCE", "captured"=>true, "created"=>1611756717, "currency"=>"usd", "customer"=>"cus_IpuZZU5oNMB8bP", "description"=>"Subscription creation", "destination"=>nil, "dispute"=>nil, "disputed"=>false, "failure_code"=>nil, "failure_message"=>nil, "fraud_details"=>{}, "invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "livemode"=>false, "metadata"=>{}, "on_behalf_of"=>nil, "order"=>nil, "outcome"=>{"network_status"=>"approved_by_network", "reason"=>nil, "risk_level"=>"normal", "risk_score"=>26, "seller_message"=>"Payment complete.", "type"=>"authorized"}, "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "payment_method_details"=>{"card"=>{"brand"=>"visa", "checks"=>{"address_line1_check"=>nil, "address_postal_code_check"=>"pass", "cvc_check"=>"pass"}, "country"=>"US", "exp_month"=>4, "exp_year"=>2024, "fingerprint"=>"35xZD7Xp6NuDTryN", "funding"=>"credit", "installments"=>nil, "last4"=>"4242", "network"=>"visa", "three_d_secure"=>nil, "wallet"=>nil}, "type"=>"card"}, "receipt_email"=>nil, "receipt_number"=>nil, "receipt_url"=>"https://pay.stripe.com/receipts/acct_16sTorIvmPrtU2SF/ch_1IEEkTIvmPrtU2SFrHPvcM4g/rcpt_IpuZVkCDwrkJf6u8oYDv1TBjp2wTPha", "refunded"=>false, "refunds"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/charges/ch_1IEEkTIvmPrtU2SFrHPvcM4g/refunds"}, "review"=>nil, "shipping"=>nil, "source"=>nil, "source_transfer"=>nil, "statement_descriptor"=>nil, "statement_descriptor_suffix"=>nil, "status"=>"succeeded", "transfer_data"=>nil, "transfer_group"=>nil}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/charges?payment_intent=pi_1IEEkTIvmPrtU2SFIJBKHes6"}, "client_secret"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6_secret_sjyA2fkUTV12Q9YZdPq18VL84", "confirmation_method"=>"automatic", "created"=>1611756717, "currency"=>"usd", "customer"=>"cus_IpuZZU5oNMB8bP", "description"=>"Subscription creation", "invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "last_payment_error"=>nil, "livemode"=>false, "metadata"=>{}, "next_action"=>nil, "next_source_action"=>nil, "on_behalf_of"=>nil, "payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "payment_method_options"=>{"card"=>{"installments"=>nil, "network"=>nil, "request_three_d_secure"=>"automatic"}}, "payment_method_types"=>["card"], "receipt_email"=>nil, "review"=>nil, "setup_future_usage"=>nil, "shipping"=>nil, "source"=>nil, "statement_descriptor"=>nil, "statement_descriptor_suffix"=>nil, "status"=>"succeeded", "transfer_data"=>nil, "transfer_group"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"payment_intent.succeeded", "webhook"=>{"id"=>"evt_1IEEkWIvmPrtU2SFPBDohnPE", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756718, "data"=>{"object"=>{"id"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "object"=>"payment_intent", "allowed_source_types"=>["card"], "amount"=>5000, "amount_capturable"=>0, "amount_received"=>5000, "application"=>nil, "application_fee_amount"=>nil, "canceled_at"=>nil, "cancellation_reason"=>nil, "capture_method"=>"automatic", "charges"=>{"object"=>"list", "data"=>[{"id"=>"ch_1IEEkTIvmPrtU2SFrHPvcM4g", "object"=>"charge", "amount"=>5000, "amount_captured"=>5000, "amount_refunded"=>0, "application"=>nil, "application_fee"=>nil, "application_fee_amount"=>nil, "balance_transaction"=>"txn_1IEEkUIvmPrtU2SF7MPH6CAl", "billing_details"=>{"address"=>{"city"=>nil, "country"=>nil, "line1"=>nil, "line2"=>nil, "postal_code"=>"42424", "state"=>nil}, "email"=>nil, "name"=>"Test User", "phone"=>nil}, "calculated_statement_descriptor"=>"TO PAY FOR A ROPE ACCE", "captured"=>true, "created"=>1611756717, "currency"=>"usd", "customer"=>"cus_IpuZZU5oNMB8bP", "description"=>"Subscription creation", "destination"=>nil, "dispute"=>nil, "disputed"=>false, "failure_code"=>nil, "failure_message"=>nil, "fraud_details"=>{}, "invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "livemode"=>false, "metadata"=>{}, "on_behalf_of"=>nil, "order"=>nil, "outcome"=>{"network_status"=>"approved_by_network", "reason"=>nil, "risk_level"=>"normal", "risk_score"=>26, "seller_message"=>"Payment complete.", "type"=>"authorized"}, "paid"=>true, "payment_intent"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "payment_method_details"=>{"card"=>{"brand"=>"visa", "checks"=>{"address_line1_check"=>nil, "address_postal_code_check"=>"pass", "cvc_check"=>"pass"}, "country"=>"US", "exp_month"=>4, "exp_year"=>2024, "fingerprint"=>"35xZD7Xp6NuDTryN", "funding"=>"credit", "installments"=>nil, "last4"=>"4242", "network"=>"visa", "three_d_secure"=>nil, "wallet"=>nil}, "type"=>"card"}, "receipt_email"=>nil, "receipt_number"=>nil, "receipt_url"=>"https://pay.stripe.com/receipts/acct_16sTorIvmPrtU2SF/ch_1IEEkTIvmPrtU2SFrHPvcM4g/rcpt_IpuZVkCDwrkJf6u8oYDv1TBjp2wTPha", "refunded"=>false, "refunds"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/charges/ch_1IEEkTIvmPrtU2SFrHPvcM4g/refunds"}, "review"=>nil, "shipping"=>nil, "source"=>nil, "source_transfer"=>nil, "statement_descriptor"=>nil, "statement_descriptor_suffix"=>nil, "status"=>"succeeded", "transfer_data"=>nil, "transfer_group"=>nil}], "has_more"=>false, "total_count"=>1, "url"=>"/v1/charges?payment_intent=pi_1IEEkTIvmPrtU2SFIJBKHes6"}, "client_secret"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6_secret_sjyA2fkUTV12Q9YZdPq18VL84", "confirmation_method"=>"automatic", "created"=>1611756717, "currency"=>"usd", "customer"=>"cus_IpuZZU5oNMB8bP", "description"=>"Subscription creation", "invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "last_payment_error"=>nil, "livemode"=>false, "metadata"=>{}, "next_action"=>nil, "next_source_action"=>nil, "on_behalf_of"=>nil, "payment_method"=>"pm_1IEEkPIvmPrtU2SFC2OrmI1O", "payment_method_options"=>{"card"=>{"installments"=>nil, "network"=>nil, "request_three_d_secure"=>"automatic"}}, "payment_method_types"=>["card"], "receipt_email"=>nil, "review"=>nil, "setup_future_usage"=>nil, "shipping"=>nil, "source"=>nil, "statement_descriptor"=>nil, "statement_descriptor_suffix"=>nil, "status"=>"succeeded", "transfer_data"=>nil, "transfer_group"=>nil}}, "livemode"=>false, "pending_webhooks"=>3, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"payment_intent.succeeded"}}
Processing by StripeEvent::WebhookController#event as XML
Completed 200 OK in 6ms (ActiveRecord: 0.0ms | Allocations: 3831)


  Parameters: {"id"=>"evt_1IEEkWIvmPrtU2SFXRCNjNx8", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756717, "data"=>{"object"=>{"id"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "object"=>"payment_intent", "allowed_source_types"=>["card"], "amount"=>5000, "amount_capturable"=>0, "amount_received"=>0, "application"=>nil, "application_fee_amount"=>nil, "canceled_at"=>nil, "cancellation_reason"=>nil, "capture_method"=>"automatic", "charges"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/charges?payment_intent=pi_1IEEkTIvmPrtU2SFIJBKHes6"}, "client_secret"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6_secret_sjyA2fkUTV12Q9YZdPq18VL84", "confirmation_method"=>"automatic", "created"=>1611756717, "currency"=>"usd", "customer"=>"cus_IpuZZU5oNMB8bP", "description"=>"Subscription creation", "invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "last_payment_error"=>nil, "livemode"=>false, "metadata"=>{}, "next_action"=>nil, "next_source_action"=>nil, "on_behalf_of"=>nil, "payment_method"=>nil, "payment_method_options"=>{"card"=>{"installments"=>nil, "network"=>nil, "request_three_d_secure"=>"automatic"}}, "payment_method_types"=>["card"], "receipt_email"=>nil, "review"=>nil, "setup_future_usage"=>nil, "shipping"=>nil, "source"=>nil, "statement_descriptor"=>nil, "statement_descriptor_suffix"=>nil, "status"=>"requires_source", "transfer_data"=>nil, "transfer_group"=>nil}}, "livemode"=>false, "pending_webhooks"=>2, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"payment_intent.created", "webhook"=>{"id"=>"evt_1IEEkWIvmPrtU2SFXRCNjNx8", "object"=>"event", "api_version"=>"2015-10-01", "created"=>1611756717, "data"=>{"object"=>{"id"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6", "object"=>"payment_intent", "allowed_source_types"=>["card"], "amount"=>5000, "amount_capturable"=>0, "amount_received"=>0, "application"=>nil, "application_fee_amount"=>nil, "canceled_at"=>nil, "cancellation_reason"=>nil, "capture_method"=>"automatic", "charges"=>{"object"=>"list", "data"=>[], "has_more"=>false, "total_count"=>0, "url"=>"/v1/charges?payment_intent=pi_1IEEkTIvmPrtU2SFIJBKHes6"}, "client_secret"=>"pi_1IEEkTIvmPrtU2SFIJBKHes6_secret_sjyA2fkUTV12Q9YZdPq18VL84", "confirmation_method"=>"automatic", "created"=>1611756717, "currency"=>"usd", "customer"=>"cus_IpuZZU5oNMB8bP", "description"=>"Subscription creation", "invoice"=>"in_1IEEkTIvmPrtU2SFGooUYnJ8", "last_payment_error"=>nil, "livemode"=>false, "metadata"=>{}, "next_action"=>nil, "next_source_action"=>nil, "on_behalf_of"=>nil, "payment_method"=>nil, "payment_method_options"=>{"card"=>{"installments"=>nil, "network"=>nil, "request_three_d_secure"=>"automatic"}}, "payment_method_types"=>["card"], "receipt_email"=>nil, "review"=>nil, "setup_future_usage"=>nil, "shipping"=>nil, "source"=>nil, "statement_descriptor"=>nil, "statement_descriptor_suffix"=>nil, "status"=>"requires_source", "transfer_data"=>nil, "transfer_group"=>nil}}, "livemode"=>false, "pending_webhooks"=>2, "request"=>"req_VOeFyb5jzSf6ju", "type"=>"payment_intent.created"}}
Completed 200 OK in 1ms (ActiveRecord: 0.0ms | Allocations: 1537)




