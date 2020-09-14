import logging

import gunicorn.glogging

LOG_FORMAT = "%(asctime)s | %(levelname)s | %(name)s | %(module)s | %(lineno)d | %(process)d | %(message)s"


class Logger(gunicorn.glogging.Logger):
    error_fmt = LOG_FORMAT

    def setup(self, cfg):
        super().setup(cfg)

        # Make sure the gunicorn master process is using our logging format
        self._set_handler(self.error_log, cfg.errorlog, logging.Formatter(fmt=LOG_FORMAT))
