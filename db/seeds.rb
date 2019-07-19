user1 = User.create!(
    username:"菊池勇気",
    name:"菊池勇気",
    birthdate:"2019-10-20",
    email:"example@railstutorial.org",
    password:"password",
    password_confirmation:"password"
)

user2 = User.create!(
    username:"demo-user",
    name:"demo-user",
    birthdate:"2019-10-20",
    email:"demo@demo.com",
    password:"password",
    password_confirmation:"password"
)

user3 = User.create!(
    username:"山田シュン",
    name:"山田シュン",
    birthdate:"2019-10-20",
    email:"example3@railstutorial.org",
    password:"password",
    password_confirmation:"password"
)

user4 = User.create!(
    username:"井口悠人",
    name:"井口悠人",
    birthdate:"2019-10-20",
    email:"example4@railstutorial.org",
    password:"password",
    password_confirmation:"password"
)

request1 = Request.create!(
        title:"Dockerの使い方教えて",
        startDateTime:"2019-10-19 10:30:00",
        endDateTime:"2019-10-19 12:30:00",
        request_detail: "Docker使ってみたいけど、imageやらcontainerやらよくわかりません。Dockerの基礎を教えてください。",
        reward: "3,000円",
        location: "福岡県福岡市天神o-o-oo",
        requirements: "元気があること",
        contact: "000-000-0987",
        creator: user2,
        recruitment_number: 1
)

request2 = Request.create!(
        title:"畑の草取り手伝って",
        startDateTime:"2019-10-19 09:00:00",
        endDateTime:"2019-10-20 14:30:00",
        request_detail: "2018年秋より祖父母がやっていた農業を引き継ぐことになり、この度お手伝いを募集します。経験等は特に問いません。元気がある方集まれー！",
        reward: "両日のご飯・宿泊代をご馳走します",
        location: "福岡県糟屋郡宇美町",
        requirements: "元気があること",
        contact: "000-000-0987",
        creator: user2,
        recruitment_number: 1
)

request4 = Request.create!(
        title:"demo",
        startDateTime:"2019-10-19 10:25:00",
        endDateTime:"2019-10-20 14:30:00",
        request_detail: "自分で交通手段を手配できる方（最寄駅：西鉄バスooo停）",
        reward: "3,000円",
        location: "福岡県糟屋郡志免町",
        requirements: "やる気があること",
        contact: "000-000-0987",
        creator: user1,
        recruitment_number: 2
)

request3 = Request.create!(
        title:"Rails",
        startDateTime:"2019-10-19 10:25:00",
        endDateTime:"2019-10-20 14:30:00",
        request_detail: "自分で交通手段を手配できる方（最寄駅：西鉄バスooo停）",
        reward: "6,000円",
        location: "福岡県福岡市西区",
        requirements: "やる気があること",
        contact: "000-000-0987",
        creator: user3,
        recruitment_number: 2
)

3.times do |n|
    title = "バス釣り教えてください-#{n+1}"
    startDateTime = "2019-10-20 10:25:00"
    endDateTime = "2019-10-20 14:30:00"
    request_detail = "demo-#{n+1}"
    location = "博多湾-#{n+1}"
    requirements = "釣り好き"
    contact = "000-000-098#{n+1}"
    reward = "昼食"

    Request.create!(
        title: title,
        startDateTime: startDateTime,
        endDateTime: endDateTime,
        request_detail: request_detail,
        reward: reward,
        location: location,
        requirements: requirements,
        contact: contact,
        creator: user1,
        recruitment_number: 1
    )
end

Request_Application.create!(
    applicant: user1,
    applied_request: request1,
    status: "applied"
)

Request_Application.create!(
    applicant: user1,
    applied_request: request2,
    status: "working"
)

Request_Application.create!(
    applicant: user1,
    applied_request: request3,
    status: "completed"
)

Request_Application.create!(
    applicant: user3,
    applied_request: request4,
    status: "completed"
)

Request_Application.create!(
    applicant: user4,
    applied_request: request4,
    status: "working"
)