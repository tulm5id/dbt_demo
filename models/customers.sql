with users as (select id as user_id,
                      created_at,
                      updated_at,
                      deleted_at,
                      username,
                      display_name
               from dbt_demo.users),

     profiles as (select id as profile_id,
                         company,
                         country,
                         user_id
                  from dbt_demo.profiles),

     final as (select users.user_id as customer_id,
                      users.created_at,
                      users.updated_at,
                      users.deleted_at,
                      users.username,
                      users.display_name,
                      profiles.company,
                      profiles.country
               from users
                        left join profiles using (user_id))

select *
from final
