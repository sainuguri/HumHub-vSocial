CREATE TABLE `calendar_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `all_day` tinyint(4) NOT NULL,
  `participation_mode` tinyint(4) NOT NULL,
  `recur` tinyint(4) DEFAULT NULL,
  `recur_type` tinyint(4) DEFAULT NULL,
  `recur_interval` tinyint(4) DEFAULT NULL,
  `recur_end` datetime DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `allow_decline` tinyint(4) DEFAULT '1',
  `allow_maybe` tinyint(4) DEFAULT '1',
  `time_zone` varchar(60) DEFAULT NULL,
  `participant_info` text,
  `closed` tinyint(1) DEFAULT '0',
  `max_participants` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `calendar_entry_participant`;

CREATE TABLE `calendar_entry_participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar_entry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `participation_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_entryuser` (`calendar_entry_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


ALTER TABLE content DROP COLUMN sticked;

ALTER TABLE content ADD COLUMN pinned tinyint(4) after object_id;

ALTER TABLE content ADD COLUMN stream_sort_date datetime after contentcontainer_id;

ALTER TABLE content ADD COLUMN stream_channel char(15) after stream_sort_date;

CREATE TABLE `content_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `module_id` varchar(100) NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-content-tag` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-content-tag-container-id` (`contentcontainer_id`),
  KEY `fk-content-tag-parent-id` (`parent_id`),
  CONSTRAINT `fk-content-tag-container-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-parent-id` FOREIGN KEY (`parent_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `content_tag_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-content-tag-rel-content-id` (`content_id`),
  KEY `fk-content-tag-rel-tag-id` (`tag_id`),
  CONSTRAINT `fk-content-tag-rel-content-id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE file ADD COLUMN show_in_stream tinyint(1) DEFAULT '1' after updated_by;

CREATE TABLE `instructor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `instructor_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `visibility` int(1) DEFAULT NULL,
  `serialized_data` text NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentcontainer` (`contentcontainer_id`),
  CONSTRAINT `contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

ALTER TABLE notification ADD COLUMN send_web_notifications tinyint(1) DEFAULT '1' AFTER group_key;

ALTER TABLE profile ADD COLUMN role_name varchar(255) AFTER url_twitter;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job` blob NOT NULL,
  `created_at` int(11) NOT NULL,
  `timeout` int(11) NOT NULL DEFAULT '0',
  `started_at` int(11) DEFAULT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `started_at` (`started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `session_name` varchar(50) DEFAULT NULL,
  `instructor_name` varchar(45) DEFAULT NULL,
  `start_day` date DEFAULT NULL,
  `end_day` date DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `hf_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid_UNIQUE` (`guid`),
  UNIQUE KEY `hf_url_UNIQUE` (`hf_url`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

CREATE TABLE `session_membership` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `show_at_dashboard` tinyint(1) DEFAULT '1',
  `send_notifications` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`session_id`,`user_id`),
  KEY `fk_session_membership-user_id_idx` (`user_id`),
  CONSTRAINT `fk_session_membership-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE space_membership ADD COLUMN send_notifications tinyint(1) AFTER can_cancel_membership;

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `tokens` int(11) DEFAULT NULL,
  `pass` int(11) DEFAULT NULL,
  `strike` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tokens_session_id_idx` (`session_id`),
  CONSTRAINT `fk_tokens_session_id` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;


ALTER TABLE user ADD COLUMN role_name varchar(20) after contentcontainer_id;



CREATE TABLE `reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `rewarded_date` date DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `rewarded_by` int(11) DEFAULT NULL,
  `rewardcol` varchar(45) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `token_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reward_1_idx` (`session_id`),
  KEY `fk_reward_user_id_idx` (`user_id`),
  KEY `fk_reward_token_id_idx` (`token_id`),
  CONSTRAINT `fk_reward_session_id` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reward_token_id` FOREIGN KEY (`token_id`) REFERENCES `tokens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reward_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(8) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

update user set role_name="Instructor" where id=1;


insert into session(id,guid,session_name,instructor_name,start_day,end_day,start_time,end_time,contentcontainer_id,url,hf_url) values (1,1,"VR Session", "Sai Shreya Nuguri", DATE('2018-08-10'), DATE('2018-08-10'), '10:00:00', '12:00:00', 1, "https://mechanic-karl-65706.netlify.com/","hifi://vSocial/games");
