module ExamHelper
  def format_spent_time spent_time
    s = (spent_time/Settings.one_thousand % Settings.sixty).to_s
    m = (spent_time/Settings.one_thousand/Settings.sixty % Settings.sixty).to_s
    h = (spent_time/(Settings.one_thousand * Settings.sixty * Settings.sixty) %
      Settings.twenty_four).to_s
    time = (t(".zero") + h)[-2..-1] + t(".colon") +
      (t(".zero") + m)[-2..-1] + t(".colon") + (t(".zero") + s)[-2..-1]
  end
end
