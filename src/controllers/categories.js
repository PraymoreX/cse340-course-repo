
// Import model functions
import {
    getAllCategories,
    getCategoryDetails,
    getProjectsByCategoryId
} from '../models/categories.js';

// Controller for all categories
const showCategoriesPage = async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Service Categories';

    res.render('categories', { title, categories });
};

// Controller for individual category details
const showCategoryDetailsPage = async (req, res) => {
    const categoryId = req.params.id;

    const categoryDetails = await getCategoryDetails(categoryId);
    const projects = await getProjectsByCategoryId(categoryId);

    const title = 'Category Details';

    res.render('category', {
        title,
        categoryDetails,
        projects
    });
};

// Export controller functions
export {
    showCategoriesPage,
    showCategoryDetailsPage
};
