class ExamWorker
  include Sidekiq::Worker

  def perform
    ExamMailer.new_exam.deliver_now
  end
end
