user = User.create!(
    username:"Test User",
    name:"Tomoki",
    birthdate:"2019-10-20",
    email:"example@railstutorial.org",
    password:"password",
    password_confirmation:"password"
)

user2 = User.create!(
    username:"Kaz",
    name:"Kaz",
    birthdate:"2019-10-20",
    email:"example2@railstutorial.org",
    password:"password",
    password_confirmation:"password"
)

user3 = User.create!(
    username:"Aya",
    name:"Aya",
    birthdate:"2019-10-20",
    email:"example3@railstutorial.org",
    password:"password",
    password_confirmation:"password"
)

request = Request.create!(
        title:"畑の草取り",
        startDateTime:"2019-10-19 10:25:00",
        endDateTime:"2019-10-20 14:30:00",
        request_detail: "2018年秋より祖父母がやっていた農業を引き継ぐことになり、お手伝いを募集します。特に経験等は問いません。元気があるかた集まれー！",
        location: "福岡県糟屋郡志免町",
        requirements: "元気があること",
        contact: "000-000-0987",
        creator: user,
        recruitment_number: 1
)

request2 = Request.create!(
        title:"畑の草取り2",
        startDateTime:"2019-10-19 10:25:00",
        endDateTime:"2019-10-20 14:30:00",
        request_detail: "2018年秋より祖父母がやっていた農業を引き継ぐことになり、お手伝いを募集します。特に経験等は問いません。元気があるかた集まれー！",
        location: "福岡県糟屋郡志免町",
        requirements: "元気があること",
        contact: "000-000-0987",
        creator: user,
        recruitment_number: 1
)

Request.create!(
        title:"Rails1",
        startDateTime:"2019-10-19 10:25:00",
        endDateTime:"2019-10-20 14:30:00",
        request_detail: "自分で交通手段を手配できる方（最寄駅：西鉄バスooo停）",
        location: "福岡県糟屋郡志免町",
        requirements: "やる気があること",
        contact: "000-000-0987",
        creator: user2,
        recruitment_number: 2
)

Request.create!(
        title:"Rails2",
        startDateTime:"2019-10-19 10:25:00",
        endDateTime:"2019-10-20 14:30:00",
        request_detail: "自分で交通手段を手配できる方（最寄駅：西鉄バスooo停）",
        location: "福岡県糟屋郡志免町",
        requirements: "やる気があること",
        contact: "000-000-0987",
        creator: user2,
        recruitment_number: 2
)

3.times do |n|
    title = "バス釣り教えてください-#{n+1}"
    startDateTime = "2019-10-20 10:25:00"
    endDateTime = "2019-10-20 14:30:00"
    request_detail = "example-#{n+1}"
    location = "example-#{n+1}"
    requirements = "18歳以上"
    contact = "000-000-098#{n+1}"

    Request.create!(
        title: title,
        startDateTime: startDateTime,
        endDateTime: endDateTime,
        request_detail: request_detail,
        location: location,
        requirements: requirements,
        contact: contact,
        creator: user,
        recruitment_number: 1
    )
end

Request_Application.create!(
    applicant: user2,
    applied_request: request,
    status: "applied"
)

Request_Application.create!(
    applicant: user3,
    applied_request: request,
    status: "working"
)