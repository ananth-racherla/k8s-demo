const winston = require('winston');
const { format } = winston;

const options = {
    console: {
        level: 'debug',
        handleExceptions: true,
        json: true,
        colorize: true,
    },
};

const logger = winston.createLogger({
    levels: winston.config.npm.levels,
    format: format.combine(
        format.splat(),
        format.json()
    ),
    transports: [
        new winston.transports.Console(options.console)
    ],
    exitOnError: false
})

module.exports = logger;
