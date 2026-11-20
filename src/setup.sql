
-- ========================================
-- Organization Table
-- ========================================

CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);


-- ========================================
-- Insert Sample Data: Organizations
-- ========================================

INSERT INTO organization
(name, description, contact_email, logo_filename)

VALUES
(
    'BrightFuture Builders',
    'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
    'info@brightfuturebuilders.org',
    'brightfuture-logo.png'
),
(
    'GreenHarvest Growers',
    'An urban farming collective promoting food sustainability and education in local neighborhoods.',
    'contact@greenharvest.org',
    'greenharvest-logo.png'
),
(
    'UnityServe Volunteers',
    'A volunteer coordination group supporting local charities and service initiatives.',
    'hello@unityserve.org',
    'unityserve-logo.png'
);

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,

    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id)
        REFERENCES public.organization(organization_id)
);

INSERT INTO public.project
(organization_id, title, description, location, project_date)
VALUES

-- BrightFuture Builders (Organization 1)
(1, 'Community School Renovation',
 'Renovating classrooms and improving school facilities.',
 'Kumasi', '2026-12-05'),

(1, 'Rural Health Centre Construction',
 'Building a health centre to improve access to healthcare.',
 'Ejisu', '2026-12-12'),

(1, 'Community Bridge Rehabilitation',
 'Repairing a bridge to improve transportation and safety.',
 'Obuasi', '2027-01-10'),

(1, 'Affordable Housing Initiative',
 'Constructing affordable homes for low income families.',
 'Accra', '2027-01-20'),

(1, 'Clean Water Infrastructure',
 'Installing water systems to provide clean drinking water.',
 'Sunyani', '2027-02-05'),

-- GreenHarvest Growers (Organization 2)
(2, 'Urban Garden Development',
 'Creating community gardens to promote urban agriculture.',
 'Kumasi', '2026-12-08'),

(2, 'School Vegetable Farming',
 'Establishing vegetable gardens in local schools.',
 'Accra', '2026-12-18'),

(2, 'Community Tree Planting',
 'Planting fruit trees to improve food security.',
 'Cape Coast', '2027-01-08'),

(2, 'Sustainable Farming Workshop',
 'Training farmers in sustainable agricultural practices.',
 'Tamale', '2027-01-25'),

(2, 'Organic Composting Project',
 'Teaching communities how to produce organic compost.',
 'Koforidua', '2027-02-12'),

-- UnityServe Volunteers (Organization 3)
(3, 'Community Clean Up Exercise',
 'Organizing volunteers to clean public spaces.',
 'Kumasi', '2026-12-06'),

(3, 'Orphanage Support Programme',
 'Providing essential supplies and support to orphanages.',
 'Accra', '2026-12-20'),

(3, 'Elderly Care Outreach',
 'Visiting and supporting elderly people in the community.',
 'Ho', '2027-01-15'),

(3, 'Youth Mentorship Programme',
 'Connecting young people with mentors and career guidance.',
 'Takoradi', '2027-01-28'),

(3, 'Community Health Awareness',
 'Organizing health education and awareness campaigns.',
 'Sunyani', '2027-02-15');