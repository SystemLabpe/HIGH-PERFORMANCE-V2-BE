DROP TABLE IF EXISTS `hp_db`.`tournaments`;
CREATE TABLE `hp_db`.`tournaments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_init` date NOT NULL,
  `date_end` date NOT NULL,
  `club_id` int(10) unsigned NOT NULL,
  `rival_club_id` int(10) unsigned NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `club_tournament_idx` (`club_id` ASC),
  CONSTRAINT `club_tournament_fk`
    FOREIGN KEY (`club_id`)
    REFERENCES `hp_db`.`clubs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `hp_db`.`tournament_club` ;
CREATE TABLE IF NOT EXISTS `hp_db`.`tournament_club` (
  `tournament_id` INT(11) unsigned NOT NULL,
  `club_id` INT(11) unsigned NOT NULL,
  `rival_club_id` INT(11) unsigned NOT NULL,
  PRIMARY KEY (`tournament_id`, `club_id`),
  INDEX `tour_tour_club_idx` (`tournament_id` ASC),
  INDEX `club_tour_club_idx` (`club_id` ASC),
  INDEX `rclub_tour_club_idx` (`rival_club_id` ASC),
  CONSTRAINT `tour_tour_club_fk`
    FOREIGN KEY (`tournament_id`)
    REFERENCES `hp_db`.`tournaments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `club_tour_club_fk`
    FOREIGN KEY (`club_id`)
    REFERENCES `hp_db`.`clubs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rclub_tour_club_fk`
    FOREIGN KEY (`rival_club_id`)
    REFERENCES `hp_db`.`clubs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `hp_db`.`matchs`;
CREATE TABLE `hp_db`.`matchs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_detail` varchar(255) NULL,
  `match_date` date NOT NULL,
  `home_score` VARCHAR(200) NOT NULL,
  `away_score` VARCHAR(200) NOT NULL,
  `tournament_id` int(10) unsigned NULL,
  `home_club_id` int(10) unsigned NULL,
  `away_club_id` int(10) unsigned NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `tournament_match_idx` (`tournament_id` ASC),
  INDEX `hclub_match_idx` (`home_club_id` ASC),
  INDEX `aclub_match_idx` (`away_club_id` ASC),
  CONSTRAINT `tournament_match_fk`
    FOREIGN KEY (`tournament_id`)
    REFERENCES `hp_db`.`tournaments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `hclub_match_fk`
    FOREIGN KEY (`home_club_id`)
    REFERENCES `hp_db`.`clubs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `aclub_match_fk`
    FOREIGN KEY (`away_club_id`)
    REFERENCES `hp_db`.`clubs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `hp_db`.`chances`;
CREATE TABLE `hp_db`.`chances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_home` tinyint(1) NOT NULL DEFAULT '1',
  `chance_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:PLAY 2:SHOOT PLAY',
  `chance_minute` tinyint(3) NOT NULL,
  `is_goal` tinyint(1) NOT NULL DEFAULT '1',
  
  `assisted_player` varchar(255) NULL,
  `scored_player` varchar(255) NULL,
  
  `match_id` int(10) unsigned NULL,
  
  `stopped_ball_id` int(10) unsigned NULL,
  
  `start_type_id` int(10) unsigned NULL,
  `field_zone_id` int(10) unsigned NULL,
  `initial_penetration_id` int(10) unsigned NULL,
  `player_position_id` int(10) unsigned NULL,
  `field_area_id` int(10) unsigned NULL,
  `invation_level_id` int(10) unsigned NULL,
  `numerical_balance_id` int(10) unsigned NULL,
  `possession_passes_id` int(10) unsigned NULL,
  `penetrating_passes_id` int(10) unsigned NULL,
  `progression_type_id` int(10) unsigned NULL,
  `pentagon_completion_id` int(10) unsigned NULL,
  `previous_action_id` int(10) unsigned NULL,
  `completion_action_id` int(10) unsigned NULL,
  `penultimate_field_zone_id` int(10) unsigned NULL,
  `last_field_zone_id` int(10) unsigned NULL,
  
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `match_chance_idx` (`match_id` ASC),
  INDEX `sball_chance_idx` (`stopped_ball_id` ASC),
  INDEX `st_chance_idx` (`start_type_id` ASC),
  INDEX `fz_chance_idx` (`field_zone_id` ASC),
  INDEX `ip_chance_idx` (`initial_penetration_id` ASC),
  INDEX `pp_chance_idx` (`player_position_id` ASC),
  INDEX `fa_chance_idx` (`field_area_id` ASC),
  INDEX `il_chance_idx` (`invation_level_id` ASC),
  INDEX `nb_chance_idx` (`numerical_balance_id` ASC),
  INDEX `ppa_chance_idx` (`possession_passes_id` ASC),
  INDEX `pep_chance_idx` (`penetrating_passes_id` ASC),
  INDEX `pt_chance_idx` (`progression_type_id` ASC),
  INDEX `pc_chance_idx` (`pentagon_completion_id` ASC),
  INDEX `pa_chance_idx` (`previous_action_id` ASC),
  INDEX `ca_chance_idx` (`completion_action_id` ASC),
  INDEX `pfz_chance_idx` (`penultimate_field_zone_id` ASC),
  INDEX `lfz_chance_idx` (`last_field_zone_id` ASC),
  CONSTRAINT `match_chance_fk`
    FOREIGN KEY (`match_id`)
    REFERENCES `hp_db`.`matchs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sball_chance_fk`
    FOREIGN KEY (`stopped_ball_id`)
    REFERENCES `hp_db`.`stopped_balls` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `st_chance_fk`
    FOREIGN KEY (`start_type_id`)
    REFERENCES `hp_db`.`start_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fz_chance_fk`
    FOREIGN KEY (`field_zone_id`)
    REFERENCES `hp_db`.`field_zones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ip_chance_fk`
    FOREIGN KEY (`initial_penetration_id`)
    REFERENCES `hp_db`.`initial_penetrations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pp_chance_fk`
    FOREIGN KEY (`player_position_id`)
    REFERENCES `hp_db`.`player_positions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fa_chance_fk`
    FOREIGN KEY (`field_area_id`)
    REFERENCES `hp_db`.`field_areas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `il_chance_fk`
    FOREIGN KEY (`invation_level_id`)
    REFERENCES `hp_db`.`invation_levels` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nb_chance_fk`
    FOREIGN KEY (`numerical_balance_id`)
    REFERENCES `hp_db`.`numerical_balances` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ppa_chance_fk`
    FOREIGN KEY (`possession_passes_id`)
    REFERENCES `hp_db`.`possession_passes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pep_chance_fk`
    FOREIGN KEY (`penetrating_passes_id`)
    REFERENCES `hp_db`.`penetrating_passes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pt_chance_fk`
    FOREIGN KEY (`progression_type_id`)
    REFERENCES `hp_db`.`progression_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pc_chance_fk`
    FOREIGN KEY (`pentagon_completion_id`)
    REFERENCES `hp_db`.`pentagon_completions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pa_chance_fk`
    FOREIGN KEY (`previous_action_id`)
    REFERENCES `hp_db`.`previous_actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ca_chance_fk`
    FOREIGN KEY (`completion_action_id`)
    REFERENCES `hp_db`.`completion_actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pfz_chance_fk`
    FOREIGN KEY (`penultimate_field_zone_id`)
    REFERENCES `hp_db`.`field_zones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `lfz_chance_fk`
    FOREIGN KEY (`last_field_zone_id`)
    REFERENCES `hp_db`.`field_zones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



