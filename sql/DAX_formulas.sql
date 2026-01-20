
1. Average Retention percent:

Average Retention % = 
AVERAGEX(
    VALUES('active_users_per_cohort'[cohort_month_label]),
    [Retention %]
)

2. Average retention Month 1

Avg M1 Retention = 
DIVIDE(
    SUMX(
        FILTER('active_users_per_cohort', 'active_users_per_cohort'[month_number] = 1),
        'active_users_per_cohort'[active_users]
    ),
    SUMX(
        FILTER('active_users_per_cohort', 'active_users_per_cohort'[month_number] = 0),
        'active_users_per_cohort'[active_users]
    )
)

3. Average M3 retention

Avg M3 Retention = 
DIVIDE(
    SUMX(
        FILTER('active_users_per_cohort', 'active_users_per_cohort'[month_number] = 3),
        'active_users_per_cohort'[active_users]
    ),
    SUMX(
        FILTER('active_users_per_cohort', 'active_users_per_cohort'[month_number] = 0),
        'active_users_per_cohort'[active_users]
    )
)

4. Cohort size

Cohort_size = CALCULATE(
    MAX('active_users_per_cohort'[active_users]),
    'active_users_per_cohort'[month_number] = 0
)

5. Retention percent

Retention % = DIVIDE(
    SUM('active_users_per_cohort'[active_users]),
    [Cohort_size]
)
