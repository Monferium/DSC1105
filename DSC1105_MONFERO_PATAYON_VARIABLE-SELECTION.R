file_path <- "C:\\Users\\spike\\Downloads\\NSFG-2022-2023-FemRespPUFData\\NSFG_2022_2023_FemRespPUFData.csv"  # Update with your actual CSV filename

nsfg_data <- read.csv(file_path)

selected_vars <- c(
  "PTSB4MAR", "AGE_R", "RSCRRACE", "RSCRHISP", "EARNBA_Y", "NUMCHILD",
  "CURRMETH1", "MARSTAT", "EVERTUBS", "RHADALL", "MENARCHE", "EVERSEX",
  "GENHEALT", "BMICAT", "SMK100", "DRINK12", "PREGNUM"
)

missing_vars <- setdiff(selected_vars, names(nsfg_data))
if (length(missing_vars) > 0) {
  warning("The following variables are missing from the CSV file: ", paste(missing_vars, collapse = ", "))
}

# Subset to only the available selected variables
available_vars <- intersect(selected_vars, names(nsfg_data))
nsfg_subset <- nsfg_data[, available_vars]

write.csv(nsfg_subset, "nsfg_selected_variables.csv", row.names = FALSE)

cat("✅ Subset saved to: nsfg_selected_variables.csv\n")
