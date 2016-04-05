namespace :todo do
  desc "delete items older than 7 days"
  task delete_items: :environment do
    Item.where("expires_at < ?", Time.now).destroy_all
  end

end
