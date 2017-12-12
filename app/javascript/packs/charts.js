import FusionCharts from "fusioncharts";
// import "fusioncharts/fusioncharts.charts"
require("fusioncharts/fusioncharts.charts")(FusionCharts);
// import "fusioncharts/themes/fusioncharts.theme.fint"

document.addEventListener('DOMContentLoaded', (event) => {
  // Do something (callback)
  const chartContainer = document.getElementById('chart-container');
  if (chartContainer) {
    // const source = JSON.parse(chartContainer.dataset.source);
    const days = JSON.parse(chartContainer.dataset.days);
    const series = JSON.parse(chartContainer.dataset.series);
    // console.log(typeof(source));

    FusionCharts.ready(function(){
      var revenueChart = new FusionCharts({
        "type": "msline",
        "renderAt": 'chart-container',
         "width": "500",
         "height": "300",
         "dataFormat": "json",
         "dataSource": {
            chart:{
              "caption": "Number of visitors last week",
              "subCaption": "Bakersfield Central vs Los Angeles Topanga",
              "captionFontSize": "14",
              "subcaptionFontSize": "14",
              "subcaptionFontBold": "0",
              "paletteColors": "#0075c2,#1aaf5d",
              "bgcolor": "#ffffff",
              "showBorder": "0",
              "showShadow": "0",
              "showCanvasBorder": "0",
              "usePlotGradientColor": "0",
              "legendBorderAlpha": "0",
              "legendShadow": "0",
              "showAxisLines": "0",
              "showAlternateHGridColor": "0",
              "divlineThickness": "1",
              "divLineIsDashed": "1",
              "divLineDashLen": "1",
              "divLineGapLen": "1",
              "xAxisName": "Day",
              "showValues": "0"
            },
            // data: source,
            categories: days,
            dataset: series,
         }
      }).render('chart-container');
    });
  }
});


