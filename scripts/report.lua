wrk.method = "POST"
wrk.body =
  [[appointmentReport(filter: {startsAt: "2018-07-10T22:00:00.000Z",
    endsAt: "2018-07-20T22:00:00.000Z"}) {
    total
    noShow
    created
    confirmed}}]]
wrk.headers["Authorization"] = "Bearer 00000000-0000-4000-8000-000000000000"
