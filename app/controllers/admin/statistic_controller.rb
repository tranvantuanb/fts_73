class Admin::StatisticController < ApplicationController
  def index
    @scores = Exam.statistic_score
    @categories = []
    categories
    respond_to do |format|
      format.json {
        render json: [{categories: @categories}, {name: t(".score"),
          data: @scores}]
      }
    end
  end

  def categories
    (0..Subject.maximum(:question_number)).each do |n|
      @categories << n.to_s
    end
  end
end
