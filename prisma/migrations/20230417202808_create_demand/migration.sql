-- AlterTable
ALTER TABLE `categories` ADD COLUMN `is_active` BOOLEAN NOT NULL DEFAULT true;

-- CreateTable
CREATE TABLE `demands` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `annotations` LONGTEXT NOT NULL,
    `deadline` DATETIME(3) NOT NULL,
    `city_id` VARCHAR(191) NOT NULL,
    `created_by_user_id` VARCHAR(191) NOT NULL,
    `buyer_id` VARCHAR(191) NOT NULL,
    `maintainer_id` VARCHAR(191) NOT NULL,
    `category_id` VARCHAR(191) NOT NULL,
    `subcategory_id` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,
    `deleted_reason` VARCHAR(191) NULL,
    `file_url` VARCHAR(191) NULL,
    `file_name` VARCHAR(191) NULL,
    `validated` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `demands_has_buyers` (
    `demand_id` VARCHAR(191) NOT NULL,
    `buyer_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `demands_has_buyers_demand_id_key`(`demand_id`),
    PRIMARY KEY (`demand_id`, `buyer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `demands_has_maintainers` (
    `demand_id` VARCHAR(191) NOT NULL,
    `maintainer_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `demands_has_maintainers_demand_id_key`(`demand_id`),
    PRIMARY KEY (`demand_id`, `maintainer_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `companies_has_categories` (
    `id` VARCHAR(191) NOT NULL,
    `company_id` VARCHAR(191) NOT NULL,
    `category_id` VARCHAR(191) NOT NULL,
    `subcategory_id` VARCHAR(191) NOT NULL,
    `type_action` INTEGER NULL,
    `type_company` ENUM('company', 'industry') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `industries` (
    `id` VARCHAR(191) NOT NULL,
    `company_name` VARCHAR(150) NOT NULL,
    `email` VARCHAR(150) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `demands` ADD CONSTRAINT `demands_city_id_fkey` FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `demands` ADD CONSTRAINT `demands_created_by_user_id_fkey` FOREIGN KEY (`created_by_user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `demands` ADD CONSTRAINT `demands_subcategory_id_fkey` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `demands` ADD CONSTRAINT `demands_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `demands_has_buyers` ADD CONSTRAINT `demands_has_buyers_buyer_id_fkey` FOREIGN KEY (`buyer_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `demands_has_buyers` ADD CONSTRAINT `demands_has_buyers_demand_id_fkey` FOREIGN KEY (`demand_id`) REFERENCES `demands`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `demands_has_maintainers` ADD CONSTRAINT `demands_has_maintainers_maintainer_id_fkey` FOREIGN KEY (`maintainer_id`) REFERENCES `industries`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `demands_has_maintainers` ADD CONSTRAINT `demands_has_maintainers_demand_id_fkey` FOREIGN KEY (`demand_id`) REFERENCES `demands`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `companies_has_categories` ADD CONSTRAINT `companies_has_categories_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `companies_has_categories` ADD CONSTRAINT `companies_has_categories_subcategory_id_fkey` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `companies_has_categories` ADD CONSTRAINT `companies_has_categories_company_id_fkey` FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
