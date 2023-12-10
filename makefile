backup: 
	@if [ ! $(backup) ]; then echo "Enter: <source=source_folder> <backup=backup_folder> <seconds=seconds_number> <max_folders=max_number>"; exit 1; fi
	@if [ ! -d "$(backup)" ]; then mkdir $(backup); fi
	@bash ./backupd.sh $(source) $(backup) $(seconds) $(max)
.PHONY: backup
