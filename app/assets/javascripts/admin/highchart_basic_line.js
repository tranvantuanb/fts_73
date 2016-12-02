var StatisticChart = {
  options: {
    title: {
      text: I18n.t("score_statistics"),
      x: -80 //center
    },

    xAxis: {
      categories: []
    },

    yAxis: {
      title: {
        text: I18n.t("score_percent"),
        style: {
          color: Highcharts.getOptions().colors[1]
        }
      }
    },
    tooltip: {
      valueSuffix: '%'
    },
    legend: {
      layout: I18n.t("vertical"),
      align: I18n.t("right"),
      verticalAlign: I18n.t("middle"),
    },
    series: []
  },

  initialize: function() {
    StatisticChart.options.series = [];
    StatisticChart.options.xAxis.categories = [];
    $.getJSON('/admin/statistic.json', function(data) {
      StatisticChart.options.series.push({
          name: data[1].name,
          data: data[1].data
        });
      StatisticChart.options.xAxis.categories = data[0].categories;
      StatisticChart.draw_chart();
    });
  },

  draw_chart: function() {
    Highcharts.chart('chart-container', StatisticChart.options);
  }
}

function init_chart_basic_line() {
  StatisticChart.initialize();
};
