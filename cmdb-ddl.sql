CREATE TABLE `cmdb_ci` (
  `id` bigint(20) NOT NULL,
  `ci_type` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ci_type_idx` (`ci_type`),
  CONSTRAINT `fk_ci_type` FOREIGN KEY (`ci_type`) REFERENCES `cmdb_ci_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cmdb_ci_attribute` (
  `id` bigint(20) NOT NULL,
  `attr_type` bigint(20) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `value_data` varchar(2048) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attribute_attrid_idx` (`attr_type`),
  KEY `fk_attribute_ownerId_idx` (`id`),
  CONSTRAINT `fk_attribute_ownerId` FOREIGN KEY (`id`) REFERENCES `cmdb_ci` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cmdb_ci_type` (
  `id` bigint(20) NOT NULL,
  `derived_from_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `descritpion` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ci_type_parentTypeId_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cmdb_ci_type_attr` (
  `id` bigint(20) NOT NULL,
  `ref_type` bigint(20) DEFAULT NULL,
  `value_type` varchar(1024) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `min_occurs` int(11) DEFAULT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `is_display` bit(1) DEFAULT b'1',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ci_type_attr_type_idx` (`owner_id`),
  CONSTRAINT `fk_ci_type_attr_type` FOREIGN KEY (`owner_id`) REFERENCES `cmdb_ci_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
