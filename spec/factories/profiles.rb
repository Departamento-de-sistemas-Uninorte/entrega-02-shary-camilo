FactoryBot.define do
    factory :profile do
        sequence(:id) { |n| "#{n}"}
        sequence(:tweet) { |n| "#ok contenido del tweet #{n} "}
        
        updated_at {Time.now}
        created_at {Time.now}

      	user_name {"a"}
    	  
    end

end