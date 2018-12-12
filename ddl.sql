CREATE TABLE `metric` (
  `id` int(11) NOT NULL,
  `metric` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value_type` varchar(45) DEFAULT NULL,
  `desc` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `metric_UNIQUE` (`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `metric_data` (
  `metric_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `value` varbinary(6) DEFAULT NULL,
  PRIMARY KEY (`metric_id`,`timestamp`),
  CONSTRAINT `fk_metric_data_metric` FOREIGN KEY (`metric_id`) REFERENCES `metric` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `metric_tag` (
  `metric_id` int(11) NOT NULL,
  `tag_key` varchar(256) NOT NULL,
  `tag_value` varchar(256) NOT NULL,
  PRIMARY KEY (`metric_id`,`tag_key`,`tag_value`),
  KEY `fk_metric_tag_metric1_idx` (`metric_id`),
  KEY `fk_metric_tag_tag1_idx` (`tag_key`,`tag_value`),
  CONSTRAINT `fk_metric_tag_metric1` FOREIGN KEY (`metric_id`) REFERENCES `metric` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_metric_tag_tag1` FOREIGN KEY (`tag_key`, `tag_value`) REFERENCES `tag` (`key`, `value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tag` (
  `key` varchar(256) NOT NULL,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE `metric` (
  `metric_id` int(11) NOT NULL AUTO_INCREMENT,
  `metric` varchar(1024) DEFAULT NULL,
  `metric_name` varchar(64) DEFAULT NULL,
  `value_type` varchar(12) DEFAULT NULL,
  `metric_kind` varchar(12) DEFAULT NULL COMMENT 'GAUGE:An instantaneous measurement of a value\nDELTA:The change in a value during a time interval.\nCounter\nCUMULATIVE: // A value accumulated over a time interval.  Cumulative\n    // measurements in a time series should have the same start time\n    // and increasing end times, until an event resets the cumulative\n    // value to zero and sets a new start time for the following\n    // points',
  `value_unit` varchar(12) DEFAULT NULL,
  `metric_desc` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`metric_id`),
  UNIQUE KEY `metric_UNIQUE` (`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `metric_data` (
  `metric_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `value` varbinary(256) DEFAULT NULL,
  PRIMARY KEY (`metric_id`,`timestamp`),
  CONSTRAInnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `metric_tag` (
  `metric_id` int(11) NOT NULL,
  `tag_key` varchar(64) NOT NULL,
  `tag_value` varchar(64) NOT NULL,
  PRIMARY KEY (`metric_id`,`tag_key`,`tag_value`),
  KEY `fk_metric_tag_metric1_idx` (`metric_id`),
  KEY `fk_metric_tag_tag1_idx` (`tag_key`,`tag_value`),
  CONSTRAINT `fk_metric_tag_metric1` FOREIGN KEY (`metric_id`) REFERENCES `metric` (`metric_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_metric_tag_tag1` FOREIGN KEY (`tag_key`, `tag_value`) REFERENCES `tag` (`key`, `value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tag` (
  `key` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INT `fk_metric_data_metric` FOREIGN KEY (`metric_id`) REFERENCES `metric` (`metric_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
