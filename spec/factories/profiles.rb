FactoryBot.define do
    factory :profile do
        sequence(:id) { |n| "#{n}"}
        sequence(:tweet) { |n| "contenido del tweet #{n} #ok "}
        
        updated_at {Time.now}
        created_at {Time.now}

      	user_name {"a"}
    	  
    end

end