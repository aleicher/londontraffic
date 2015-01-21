angular.module('trafficApp.controllers', [])
  .controller('DisruptionsCtrl', ['$scope', 'DisruptionsSvc', 'leafletData',
    function($scope, DisruptionsSvc, leafletData) {
      angular.extend($scope, {
        center: {
          lat: 51.505,
          lng: -0.09,
          zoom: 8
            //autoDiscover: true
        },
        events: {
          map: {
            enable: ['moveend', 'popupopen'],
            logic: 'emit'
          },
          marker: {
            enable: [],
            logic: 'emit'
          }
        },
        layers: {
          baselayers: {
            osm: {
              name: 'OpenStreetMap',
              type: 'xyz',
              url: 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              layerOptions: {
                subdomains: ['a', 'b', 'c'],
                attribution: '© OpenStreetMap contributors',
                continuousWorld: true
              }
            }
          },
          overlays: {
            realworld: {
              name: "Real world data",
              type: "markercluster",
              visible: true,
              "layerOptions": {
                "chunkedLoading": true,
                "showCoverageOnHover": false,
                "removeOutsideVisibleBounds": true
              }
            },
          }
        }
      });

      $scope.markers = [];

      DisruptionsSvc.getDisruptions().then(
        function(data) {
          angular.forEach(data, addDisruptionToMap);
          addDisruptionToMap(data[0]);
        }, function(data) {
          alert(data);
        }
      );


      var addDisruptionToMap = function(disruptionData) {
        coords = disruptionData.CauseArea.DisplayPoint.Point.coordinatesLL.split(',');
        $scope.markers.push({
          lat: parseFloat(coords[1]),
          lng: parseFloat(coords[0]),
          message: disruptionData.comments,
          layer: 'realworld'
        });
      };
    }
  ]);
