FactoryBot.define do

    factory :user do
        sequence(:id) { |n| "#{n}"}
        sequence(:email) {|n| "nombre#{n}@dominio.com"}
        sequence(:user_name) {|n| "nombre#{n}"}
        sequence(:password) {|n| "password#{n}"}
        updated_at {Time.now}
        created_at {Time.now}
        confirmed_at {Time.now}
        

    end
  end