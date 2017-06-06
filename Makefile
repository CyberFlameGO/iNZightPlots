R := R --vanilla --slave

default:
	@$(R) -f templates/importTemplates.R

document:
	@$(R) -e "devtools::document()"

check:
	@$(R) -e "devtools::check()"

revcheck:
	@$(R) -e "devtools::use_revdep()"
	@$(R) -f "revdep/check.R"

crancheck:
	@R CMD build .
	@R CMD check *.tar.gz

install:
	R CMD INSTALL ./

clean:
	@rm -rf *.tar.gz *.Rcheck revdep
