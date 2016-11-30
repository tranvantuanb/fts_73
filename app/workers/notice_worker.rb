class NoticeWorker
  include Sidekiq::Worker

  def perform member_id
    ExamMailer.notice_overtime(member_id).deliver_now
  end
end
