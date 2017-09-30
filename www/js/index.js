/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
function onOnline() {
  // Handle the online event
  var networkState = navigator.connection.type;
  if (networkState !== Connection.NONE) {
    tryToRender();
  }
}
function onOffline() {
  // Handle the offline event
  console.log("lost connection");
  alert("lost connection, please check your network setting ...");
}
function tryToRender() {
  // Here, we redirect to the web site.
  // var targetUrl = "https://m.tinydeal.com/";
  var targetUrl = "https://m.poplaser.com/amp";
  window.location.replace(targetUrl + '?cord_platform=' + device.platform + '&cord_version=' + device.version);
}
var app = {
  // Application Constructor
  initialize: function() {
    document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
  },

  // deviceready Event Handler
  //
  // Bind any cordova events here. Common events are:
  // 'pause', 'resume', etc.
  onDeviceReady: function() {
    this.receivedEvent('deviceready');

    onOnline();
    document.addEventListener("offline", onOffline, false);
    document.addEventListener("online", onOnline, false);  // 它依赖于相同的信息连接的API，和当connection.type从NONE改变到其他值时触发
  },

  // Update DOM on a Received Event
  receivedEvent: function(id) {
    var parentElement = document.getElementById(id);
    var listeningElement = parentElement.querySelector('.listening');
    var receivedElement = parentElement.querySelector('.received');

    listeningElement.setAttribute('style', 'display:none;');
    receivedElement.setAttribute('style', 'display:block;');

    console.log('Received Event: ' + id);
  }
};

app.initialize();
