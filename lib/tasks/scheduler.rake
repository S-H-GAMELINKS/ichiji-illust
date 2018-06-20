desc "This task is called by the Heroku scheduler add-on"

task :toot => :environment do

    client = Mastodon::REST::Client.new(base_url: ENV["MASTODON_URL"], bearer_token: ENV["MASTODON_ACCESS_TOKEN"])

    @illust = Illust.find(rand(Illust.ids))
    message = ("#{@illust.author} さんの作品 [#{@illust.title}] です！\n\n [作品解説]\n #{@illust.memo} https://ichiji-illust.herokuapp.com/illusts/#{@illust.id}")
    response = client.create_status(message)
end

task :new_user => :environment do
    stream = Mastodon::Streaming::Client.new(base_url: ENV["MASTODON_URL"], bearer_token: ENV["MASTODON_ACCESS_TOKEN"])
    client = Mastodon::REST::Client.new(base_url: ENV["MASTODON_URL"], bearer_token: ENV["MASTODON_ACCESS_TOKEN"])
    
    stream.firehose() do |toot|
        if toot.uri.to_s =~ /#{ENV['MASTODON_URL'].to_s}/ then
            message = ("@S_H_@ichiji.social 燃えろ #IchijiIllust ")
            response = client.create_status(message)
        end
    end
end