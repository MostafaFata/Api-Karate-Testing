function fn() {
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);

  var config = { // base config JSON
       BASE_URL : 'https://qa.insurance-api.tekschool-students.com'
  }

  if (env == 'dev') {
    config.BASE_URL = 'https://dev.insurance-api.tekschool-students.com';
  } else if (env == 'qa') {
     config.BASE_URL = 'https://qa.insurance-api.tekschool-students.com';
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.log("karate config: ", config);
  return config;
}