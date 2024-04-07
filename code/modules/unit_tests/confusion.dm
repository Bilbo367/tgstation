// Checks that the confusion symptom correctly gives, and removes, confusion
/datum/unit_test/confusion_symptom/Run()
	// Ignore randomization
	GLOB.symptom_randomness[/datum/disease/advance/confusion] = list("stealth" = 0, "resistance" = 0, "stage_speed" = 0, "transmittable" = 0, "power" = 0)
	var/mob/living/carbon/human/dummy = allocate(/mob/living/carbon/human/consistent)
	var/datum/disease/advance/confusion/disease = allocate(/datum/disease/advance/confusion)
	var/datum/symptom/confusion/confusion = disease.symptoms[1]
	disease.processing = TRUE
	disease.update_stage(5)
	disease.infect(dummy, make_copy = FALSE)
	confusion.Activate(disease)
	TEST_ASSERT(dummy.has_status_effect(/datum/status_effect/confusion), "Human is not confused after getting symptom.")
	disease.cure()
	TEST_ASSERT(!dummy.has_status_effect(/datum/status_effect/confusion), "Human is still confused after curing confusion.")

/datum/disease/advance/confusion/New()
	symptoms += new /datum/symptom/confusion
	Refresh()
