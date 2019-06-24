user = User.create!(
    username:"Test User",
    name:"Tomoki",
    birthdate:"2019-10-20",
    email:"example@railstutorial.org",
    password:"password",
    password_confirmation:"password"
)

request = Request.create!(
        title:"畑の草取り",
        startDateTime:"2019-10-19 10:25:00",
        endDateTime:"2019-10-19 14:30:00",
        request_detail: "自分で交通手段を手配できる方（最寄駅：西鉄バスooo停）",
        location: "福岡県糟屋郡志免町",
        requirements: "長靴、作業服、軍手、飲み物",
        contact: "000-000-0987",
        user: user
)

3.times do |n|
    title = "バス釣り教えてください"
    startDateTime = "2019-10-20 10:25:00"
    endDateTime = "2019-10-20 14:30:00"
    request_detail = "example-#{n+1}"
    location = "example-#{n+1}"
    requirements = "長靴、作業服、軍手、飲み物"
    contact = "000-000-098#{n+1}"

    Request.create!(
        title: title,
        startDateTime: startDateTime,
        endDateTime: endDateTime,
        request_detail: request_detail,
        location: location,
        requirements: requirements,
        contact: contact,
        user: user
    )
end

Application.create!(
    applicant_id: user.id,
    request: request,
    status: "applied"
)