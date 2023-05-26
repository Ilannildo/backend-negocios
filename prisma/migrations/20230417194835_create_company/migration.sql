-- CreateTable
CREATE TABLE `companies` (
    `id` VARCHAR(191) NOT NULL,
    `document` VARCHAR(191) NULL,
    `company_name` VARCHAR(191) NOT NULL,
    `trading_name` VARCHAR(191) NOT NULL,
    `cnae` VARCHAR(191) NULL,
    `revenue` VARCHAR(191) NULL,
    `type_port` VARCHAR(191) NULL,
    `type` INTEGER NOT NULL,
    `company_type` ENUM('common', 'approved') NOT NULL DEFAULT 'common',
    `company_interest` JSON NULL,
    `phone_company` VARCHAR(191) NULL,
    `email_company` VARCHAR(191) NULL,
    `status_payment` BOOLEAN NOT NULL DEFAULT false,
    `first_login` BOOLEAN NOT NULL DEFAULT false,
    `presentation_file` VARCHAR(191) NULL,
    `presentation_url` VARCHAR(191) NULL,
    `attachment_url` VARCHAR(191) NULL,
    `attachment_file` VARCHAR(191) NULL,
    `service_region` VARCHAR(191) NULL,
    `average_revenue` DOUBLE NULL,
    `collaborators` INTEGER NULL,
    `type_establishment` VARCHAR(191) NULL,
    `main_client` VARCHAR(191) NULL,
    `main_equipment` VARCHAR(191) NULL,
    `photo_company` VARCHAR(191) NULL,
    `photo_company_main` VARCHAR(191) NULL,
    `photo_company_default_first` VARCHAR(191) NULL,
    `presentation_file_photo` VARCHAR(191) NULL,
    `company_website` VARCHAR(191) NULL,
    `company_evaluation` VARCHAR(191) NULL,
    `tag_type` VARCHAR(191) NULL,
    `linkedin` VARCHAR(191) NULL,
    `facebook` VARCHAR(191) NULL,
    `instagram` VARCHAR(191) NULL,
    `share_capital` DOUBLE NULL,
    `contact_name` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,
    `user_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `document`(`document`),
    UNIQUE INDEX `email_company`(`email_company`),
    UNIQUE INDEX `companies_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `addresses` (
    `id` VARCHAR(191) NOT NULL,
    `region` VARCHAR(150) NOT NULL,
    `address` VARCHAR(150) NOT NULL,
    `complement` VARCHAR(150) NULL,
    `number` VARCHAR(150) NULL,
    `other_regions` VARCHAR(191) NULL,
    `neighborhood` VARCHAR(150) NULL,
    `city_id` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `companies_has_addresses` (
    `company_id` VARCHAR(191) NOT NULL,
    `address_id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `companies_has_addresses_company_id_key`(`company_id`),
    UNIQUE INDEX `companies_has_addresses_address_id_key`(`address_id`),
    PRIMARY KEY (`company_id`, `address_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subcategories` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `category_id` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `states` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `uf` VARCHAR(2) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cities` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `zipcode` VARCHAR(8) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `state_id` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `companies` ADD CONSTRAINT `companies_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `addresses` ADD CONSTRAINT `addresses_city_id_fkey` FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `companies_has_addresses` ADD CONSTRAINT `companies_has_addresses_address_id_fkey` FOREIGN KEY (`address_id`) REFERENCES `addresses`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `companies_has_addresses` ADD CONSTRAINT `companies_has_addresses_company_id_fkey` FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subcategories` ADD CONSTRAINT `subcategories_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cities` ADD CONSTRAINT `cities_state_id_fkey` FOREIGN KEY (`state_id`) REFERENCES `states`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
