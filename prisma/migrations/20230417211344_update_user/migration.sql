/*
  Warnings:

  - You are about to drop the column `buyer_id` on the `demands` table. All the data in the column will be lost.
  - You are about to drop the column `maintainer_id` on the `demands` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `demands` DROP COLUMN `buyer_id`,
    DROP COLUMN `maintainer_id`;
