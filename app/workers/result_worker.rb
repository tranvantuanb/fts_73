class ResultWorker
  include Sidekiq::Worker

  def perform exam_id
    ExamMailer.result_exam(exam_id).deliver_now
  end
end
