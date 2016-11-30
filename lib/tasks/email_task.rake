desc "send statistic email"
task send_statistic_email: :environment do
  ExamMailer.statistic_result.deliver!
end
