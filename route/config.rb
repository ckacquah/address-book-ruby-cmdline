require_relative '../controllers/index'
require_relative '../controllers/add'
require_relative '../controllers/edit'
require_relative '../controllers/show'
require_relative '../controllers/delete'

ROUTES = {
  '/' => MainMenuController,
  '/add' => AddContactController,
  '/end' => EndMenuController,
  '/view' => ViewContactController,
  '/edit' => EditContactController,
  '/exit' => ExitAppController,
  '/delete' => DeleteContactController,
  '/invalid' => InvalidOptionController,
}

