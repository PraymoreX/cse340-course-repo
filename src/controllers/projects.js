
// Import model functions
import {
    getUpcomingProjects,
    getProjectDetails
} from '../models/projects.js';

import { getCategoriesByProjectId } from '../models/categories.js';

// Number of upcoming projects to display
const NUMBER_OF_UPCOMING_PROJECTS = 5;

// Controller for upcoming projects
const showProjectsPage = async (req, res) => {
    const projects = await getUpcomingProjects(NUMBER_OF_UPCOMING_PROJECTS);
    const title = 'Upcoming Service Projects';

    res.render('projects', { title, projects });
};

// Controller for individual project details
const showProjectDetailsPage = async (req, res) => {
    const projectId = req.params.id;

    const projectDetails = await getProjectDetails(projectId);
    const categories = await getCategoriesByProjectId(projectId);

    const title = 'Project Details';

    res.render('project', {
        title,
        projectDetails,
        categories
    });
};

// Export controller functions
export { showProjectsPage, showProjectDetailsPage };
