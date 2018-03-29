CREATE TABLE Assay(
	aid INT NOT NULL,
	acid INT NOT NULL,
	aeid INT NOT NULL,
	asid INT NOT NULL,
	assay_source_name VARCHAR(64),
	assay_source_long_name VARCHAR(64),
	assay_source_desc TEXT,
	assay_name VARCHAR(64),
	assay_desc VARCHAR(255),
	timepoint_hr INT,
	organism_id INT,
	organism VARCHAR(64),
	tissue VARCHAR(64),
	cell_format VARCHAR(64),
	cell_free_component_source VARCHAR(255),
	cell_short_name VARCHAR(64),
	cell_growth_mode VARCHAR(64),
	assay_footprINT VARCHAR(64),
	assay_format_type VARCHAR(64),
	assay_format_type_sub VARCHAR(64),
	content_readout_type VARCHAR(64),
	dilution_solvent VARCHAR(64),
	dilution_solvent_percent_max FLOAT,
	assay_component_name VARCHAR(64),
	assay_component_desc TEXT,
	assay_component_target_desc TEXT,
	parameter_readout_type VARCHAR(64),
	assay_design_type VARCHAR(64),
	assay_design_type_sub VARCHAR(64),
	biological_process_target VARCHAR(64),
	detection_technology_type VARCHAR(64),
	detection_technology_type_sub VARCHAR(64),
	detection_technology VARCHAR(64),
	signal_direction_type VARCHAR(64),
	key_assay_reagent_type VARCHAR(64),
	key_assay_reagent VARCHAR(64),
	technological_target_type VARCHAR(64),
	technological_target_type_sub VARCHAR(64),
	assay_component_endpoINT_name VARCHAR(64),
	export_ready INT,
	internal_ready INT,
	assay_component_endpoINT_desc TEXT,
	assay_function_type VARCHAR(64),
	normalized_data_type VARCHAR(64),
	analysis_direction VARCHAR(64),
	burst_assay INT,
	key_positive_control VARCHAR(64),
	signal_direction VARCHAR(64),
	intended_target_type VARCHAR(64),
	intended_target_type_sub VARCHAR(64),
	intended_target_family VARCHAR(64),
	intended_target_family_sub VARCHAR(64),
	fit_all INT,
	reagent_arid VARCHAR(255),
	reagent_reagent_name_value TEXT,
	reagent_reagent_name_value_type TEXT,
	reagent_culture_or_assay VARCHAR(255),
	PRIMARY KEY(aid, acid, aeid, asid)
);

CREATE TABLE Citation(
	citation_id INT NOT NULL,
	pmid INT NOT NULL,
	doi VARCHAR(255),
	other_source VARCHAR(64),
	other_id VARCHAR(64),
	citation VARCHAR(255),
	title VARCHAR(64),
	author VARCHAR(255),
	url VARCHAR(64),
	PRIMARY KEY(citation_id, pmid)
);

CREATE TABLE Target(
	target_id INT NOT NULL,
	intended_target_gene_id INT,
	intended_target_entrez_gene_id INT,
	intended_target_official_full_name VARCHAR(64),
	intended_target_gene_name VARCHAR(64),
	intended_target_official_symbol VARCHAR(64),
	intended_target_gene_symbol VARCHAR(64),
	intended_target_description VARCHAR(64),
	intended_target_uniprot_accession_number VARCHAR(64),
	intended_target_organism_id INT,
	intended_target_track_status VARCHAR(64),
	technological_target_gene_id INT,
	technological_target_entrez_gene_id INT,
	technological_target_official_full_name VARCHAR(64),
	technological_target_gene_name VARCHAR(64),
	technological_target_official_symbol VARCHAR(64),
	technological_target_gene_symbol VARCHAR(64),
	technological_target_description VARCHAR(64),
	technological_target_uniprot_accession_number VARCHAR(64),
	technological_target_organism_id INT,
	technological_target_track_status VARCHAR(64),
PRIMARY KEY(target_id)
);

CREATE TABLE Published(
	aeid INT NOT NULL,
	citation_id INT NOT NULL,
	pmid INT NOT NULL,
	PRIMARY KEY(aeid, citation_id, pmid),
	FOREIGN KEY(aeid) REFERENCES Assay(aeid),
	FOREIGN KEY(citation_id) REFERENCES Citation(citation_id),
	FOREIGN KEY(pmid) REFERENCES Citation(pmid),
);

CREATE TABLE Tested(
	aeid INT NOT NULL,
	target_id INT NOT NULL,
	PRIMARY KEY(aeid, target_id),
	FOREIGN KEY(aeid) REFERENCES Assay(aeid),
	FOREIGN KEY(target_id) REFERENCES Target(target_id),
);