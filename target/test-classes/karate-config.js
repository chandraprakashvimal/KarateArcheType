function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'e2e';
  }
  var config = {
    env: env,
    airlineUrl: 'https://api.instantwebtools.net/v1/airlines',
//    fname : 'chandra',
//    lname : 'prakash',
//    idVal : 100,
//    isManager : false
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.someVar = 'devEnv'
  } else if (env == 'e2e') {
    // customize
    config.someVar = 'e2eEnv'
  }
  return config;
}