desc "This task is called by the Heroku scheduler add-on"

task :toot => :environment do

    client = Mastodon::REST::Client.new(base_url: ENV["MASTODON_URL"], bearer_token: ENV["MASTODON_ACCESS_TOKEN"])

    3.times do
        @illust = Illust.find(rand(Illust.count) + 1)
        message = ("#{@illust.author} さんの作品 [#{@illust.title}] です！\n\n [作品解説]\n #{@illust.memo} https://ichiji-illust.herokuapp.com/illusts/#{@illust.id}")
        response = client.create_status(message)
    end
end