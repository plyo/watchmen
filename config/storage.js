exports = module.exports = {

  production: {
    provider : 'redis',
    options : {
      'redis' : {
        port: process.env.WATCHMEN_REDIS_PORT_PRODUCTION || 6379,
        host: process.env.REDIS_PORT_6379_TCP_ADDR || '127.0.0.1',
        db: process.env.WATCHMEN_REDIS_DB_PRODUCTION || 1
      }
    }
  },

  development: {
    provider : 'redis',
    options : {
      'redis' : {
        port: process.env.WATCHMEN_REDIS_PORT_DEVELOPMENT || 6379,
        host: process.env.REDIS_PORT_6379_TCP_ADDR || '127.0.0.1',
        db: process.env.WATCHMEN_REDIS_DB_DEVELOPMENT || 2
      }
    }
  },

  test: {
    provider : 'redis',
    options : {
      'redis' : {
        port: process.env.WATCHMEN_REDIS_PORT_TEST || 6379,
        host: process.env.REDIS_PORT_6379_TCP_ADDR || '127.0.0.1',
        db: process.env.WATCHMEN_REDIS_DB_TEST || 1
      }
    }
  }

};
