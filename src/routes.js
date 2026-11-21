import express from 'express';

// Import controller functions
import { showHomePage } from './controllers/index.js';
import {showOrganizationsPage, showOrganizationDetailsPage} from './controllers/organizations.js';
import { showCategoriesPage } from './controllers/categories.js';
import { testErrorPage } from './controllers/errors.js';
import {
    showProjectsPage,
    showProjectDetailsPage
} from './controllers/projects.js';

// Create an Express router
const router = express.Router();

// Define application routes
router.get('/', showHomePage);
router.get('/organizations', showOrganizationsPage);
// Route for organization details page
router.get('/organization/:id', showOrganizationDetailsPage);

router.get('/projects', showProjectsPage);

router.get('/project/:id', showProjectDetailsPage);

router.get('/categories', showCategoriesPage);

// Error handling route
router.get('/test-error', testErrorPage);

// Export the router
export default router;