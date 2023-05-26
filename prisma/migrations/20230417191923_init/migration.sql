-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(32) NULL,
    `role_id` VARCHAR(191) NOT NULL,
    `step_register` INTEGER NOT NULL DEFAULT 1,
    `is_active` BOOLEAN NOT NULL DEFAULT false,
    `type_company` ENUM('company', 'industry') NOT NULL DEFAULT 'company',
    `verify_register` BOOLEAN NOT NULL DEFAULT false,
    `email_verificated_at` DATETIME(3) NULL,
    `password` VARCHAR(191) NOT NULL,
    `remember_token` VARCHAR(191) NULL,
    `accepted_terms` BOOLEAN NOT NULL DEFAULT true,
    `date_accept_terms` DATETIME(3) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roles` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `register_user` BOOLEAN NOT NULL DEFAULT false,
    `delete_user` BOOLEAN NOT NULL DEFAULT false,
    `edit_user` BOOLEAN NOT NULL DEFAULT false,
    `view_user` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
